class Rco::Asiento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_many :registros, :dependent => :destroy
  accepts_nested_attributes_for :registros, allow_destroy: true
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :moneda
  #validates :cotizacion, :presence => true
  validates_associated :registros

 	def valid_save
 		transaction do
 			if save
	 			unless balancea?
	 				raise ActiveRecord::Rollback
	 				return false
	 			else
	 				return true
	 			end	
	 		else
	 			false
	 		end
 		end
 	end

 	def valid_update(params)
 		transaction do
 			if update_attributes(params)
	 			unless balancea?
	 				raise ActiveRecord::Rollback
	 			else
	 				true
	 			end	
 			else 
 				return false
 			end
 		end
 	end

  def balancea?
  	debe = registros.sum(:debe)
  	haber = registros.sum(:haber)

  	unless debe == haber
  		errors.add(:base, "El asiento no balancea")
  		return false
  	end
  	return true
  end

end
