class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
  belongs_to :cuenta
  validate do |registro|
   	registro.debe_haber
  end
 
  def debe_haber
  	unless debe_op != haber_op and [haber_op,debe_op].include? 0
  		destroy
  		errors.add(:cuenta_id, ": Revisar linea. Debe y haber deben ser distintos y al menos uno igual a 0")	
		end
	end			
end
