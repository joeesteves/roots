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
    save
    codigoEvento = evento.eventotipo.codigo.to_i
    cantidad.times do
      case codigoEvento
        when -1
          animalesOrigen = Rga::Animal.disponibles(empresa_id, establecimiento_id, 
            origcategoria_id, origrodeo_id, origestado_id, {cantidad: cantidad.to_s})
          animalesOrigen.each do |ao|
            ao.update_attributes(:estado => 0)
          end
          update_attributes(:animal_ids => animalesOrigen.collect(&:id))
        when 1
          animales.create()
      end
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



end