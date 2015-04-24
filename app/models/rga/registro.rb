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
  has_many :animales_registros
  has_many :animales, through: :animales_registros, dependent: :destroy

  def rSave
    return false unless valid?
    save
    codigoEvento = evento.eventotipo.codigo.to_i
      case codigoEvento
        when -1
          animalesOrigen = Rga::Animal.disponibles(empresa_id, establecimiento_id, 
            origcategoria_id, origrodeo_id, origestado_id, {cantidad: cantidad.to_s})
          animalesOrigen.each do |ao|
            ao.update_attributes(:estado => 0)
          end
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
    obj = Hash.new
    resultado.each do |r|
      codigo = r["codigo"].split(" - ")
      codigo_entrada = "E - " + codigo[1] + " - " + codigo[2]
      codigo_salida = "S - " + codigo[0] + " - " + codigo[2]

      if codigo[0] != codigo[1] and codigo[0] != '0' and codigo[1] != '0'
        obj[codigo_entrada] = r["cantidad"]
        obj[codigo_salida] = r["cantidad"]
      elsif codigo[0] == '0'
        obj[codigo_entrada] = r["cantidad"]
      elsif codigo[1] == '0'
        obj[codigo_salida] = r["cantidad"]
      end

    end
    obj
  end

  def self.entre_fechas(desde, hasta)
    includes(:origcategoria, :destcategoria, :evento).where("fecha >= '#{desde}' and fecha <= '#{hasta}'").references(:origcategoria, :destcategoria, :evento)
  end
end