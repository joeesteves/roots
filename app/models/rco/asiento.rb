class Rco::Asiento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_many :registros, -> {order(:haber)}, :dependent => :destroy
  has_one :operacion, class_name: "Rad::Operacion", inverse_of: :asiento
  delegate :codigo, :to => :operacion, :prefix => false
  accepts_nested_attributes_for :registros, allow_destroy: true
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :moneda
  validates :cotizacion, :presence => true
  validates_associated :registros
  before_update :esGenerado?
  before_destroy :esGenerado?
 

 	def valid_save
    transaction do
      registros.each do |r|
        r.debe = r.debe_op * cotizacion
        r.haber = r.haber_op * cotizacion
        r.desc = desc
      end
      if save
        unless balancea?
          raise ActiveRecord::Rollback
        else
          true
        end
      else
        false
      end
    end
  end
 	
 	def valid_update(params)
    
    transaction do
      assign_attributes(params)
        registros.each do |r|
          r.debe = r.debe_op * cotizacion
          r.haber = r.haber_op * cotizacion
          r.desc = desc
        end
      
      if save

        unless balancea?
	 				raise ActiveRecord::Rollback
	 			else
	 				true
	 			end	
 			else 
 				false
 			end
 		end
 	end

  def balancea?
  	debe = registros.sum(:debe)
  	haber = registros.sum(:haber)
    
    if debe != haber
      errors.add(:base, "El Asieto no balancea")
      false
    else
      true
    end
  end

  def esGenerado?
    if esgenerado == true & !operacion.nil? 
      errors.add(:base, "Asiento generado por otra transacción. Debe borrar la operación")
      false
    else
      errors.add(:base, "Asiento generado por una operacion que fue borrada") if operacion.nil?
      true
    end
  end

end
