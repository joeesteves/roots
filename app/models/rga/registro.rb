class Rga::Registro < ActiveRecord::Base
	include ModeloGlobales
  habtm_nodo
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :establecimiento, class_name: "Rba::Establecimiento"
  belongs_to :evento
  belongs_to :origcategoria, class_name: "Rga::Categoria"
  belongs_to :origrodeo, class_name: "Rga::Rodeo"
  belongs_to :origestado, class_name: "Rga::Estado"
  belongs_to :destcategoria, class_name: "Rga::Categoria"
  belongs_to :destrodeo, class_name: "Rga::Rodeo"
  belongs_to :destestado, class_name: "Rga::Estado"
  before_destroy :libera_animales
  has_many :animales_registros
  has_many :animales, through: :animales_registros


  def rSave
    return false unless valid?
    save
    codigoEvento = evento.eventotipo.codigo.to_i
      case codigoEvento
        when -1
          animalesOrigen = Rga::Animal.disponibles(empresa_id, establecimiento_id, 
            origcategoria_id, origrodeo_id, origestado_id, {cantidad: cantidad.to_s})
          update_attributes(:animal_ids => animalesOrigen.collect(&:id))
        when 1
          cantidad.times do
            animales.create()
          end
        when 2
          animalesOrigen = Rga::Animal.disponibles(empresa_id, establecimiento_id, 
            origcategoria_id, origrodeo_id, origestado_id, {cantidad: cantidad.to_s})
          update_attributes(:animal_ids => animalesOrigen.collect(&:id))
      end
  end  

  def rUpdate(rga_registro_params, cantidadFinal)
     # El codigo del evento determina el comportamiento
    #  -1 Egresos // 0 Partos // 1 Ingresos // 2 Cambios de categoria
    codigoEvento = evento.eventotipo.codigo.to_i
    cantidadInicial = cantidad
    diferencia = cantidadFinal - cantidadInicial
    update(rga_registro_params)
    case codigoEvento
      when 1 # Ingresos si se actualiza en menos borra los animales excendentes
        if diferencia > 0
           diferencia.times do
            animales.create()
          end
        elsif diferencia < 0 
          animales.last(diferencia.abs).each(&:destroy)
        end
      when 2 # Cambios de cateogria si se actualiza en menos borra los animales excendentes
        # Si la diferencia es + Buscar animales en orgien, si hay disponibles agregarlos
        # Si la diferencia es - solo borrar la relacion
        if diferencia < 0 
          animales.delete(animales.last(diferencia.abs))
        elsif diferencia > 0
          agregar_animales = Rga::Animal.disponibles(empresa_id, establecimiento_id, 
            origcategoria_id, origrodeo_id, origestado_id, {cantidad: diferencia.to_s})
          animales << agregar_animales
        end
    end      
  end

  def self.regx_categoria(desde, hasta)
    # Devuelve un hash["codigo"] = cantida codigo "[E;S] - cat_id - evento_id"
    resultado = ActiveRecord::Base.connection.select_all("select concat(if(c.origcategoria_id is null, '0 - ',concat(c.origcategoria_id, ' - ')), 
if(c.destcategoria_id is null, '0 - ',concat(c.destcategoria_id, ' - ')) , d.codigo) as codigo, 
count(a.id) as cantidad from rga_animales as a 
join rga_animales_registros as b on a.id = b.animal_id 
join rga_registros as c on c.id = b.registro_id 
join rga_eventos as d on d.id = c.evento_id
where c.fecha >= '#{desde}' and c.fecha <= '#{hasta}' 
group by c.origcategoria_id, c.destcategoria_id, c.evento_id")
    categorias = Array.new
    cantidad_categoria_registro = Hash.new
    resultado.each do |r|
      codigo = r["codigo"].split(" - ")
      codigo_entrada = "E - " + codigo[1] + " - " + codigo[2]
      codigo_salida = "S - " + codigo[0] + " - " + codigo[2]

      if codigo[0] != codigo[1] and codigo[0] != '0' and codigo[1] != '0'
        cantidad_categoria_registro[codigo_entrada] = r["cantidad"]
        cantidad_categoria_registro[codigo_salida] = r["cantidad"]
        categorias << codigo[0].to_i << codigo[1].to_i
      elsif codigo[0] == '0'
        cantidad_categoria_registro[codigo_entrada] = r["cantidad"]
        categorias << codigo[1].to_i
      elsif codigo[1] == '0'
        categorias << codigo[0].to_i
        cantidad_categoria_registro[codigo_salida] = r["cantidad"]
      end

    end
    {:cantidad_categoria_registro => cantidad_categoria_registro, :categoria_ids => categorias }
  end

  def self.entre_fechas(desde, hasta)
    includes(:origcategoria, :destcategoria, :evento).where("fecha >= '#{desde}' and fecha <= '#{hasta}'").references(:origcategoria, :destcategoria, :evento)
  end


  def libera_animales
    son_registro_unicos = true
    animales.each do |a|
      unless a.registros.last.id == id
        errors.add(:base, 'LOS ANIMALES HAN SIDO UTILIZADOS PARA TRANSACCIONES POSTERIORES')
        return false
      end
      son_registro_unicos = son_registro_unicos && a.registros.count == 1 
    end
    if son_registro_unicos
      animales.each do |a|
        a.destroy
      end
    end
  end
end