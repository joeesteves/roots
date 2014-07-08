class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
  belongs_to :cuenta
  validate do |registro|
  	registro.debe_haber
  end 

  def debe_haber
  	unless debe != haber and [haber,debe].include? 0
  		if debe == haber and debe == 0
  			destroy
  		else
  			return errors.add(:cuenta_id, ": Revisar linea. Debe y haber deben ser distintos y al menos uno igual a 0")	
			end
		end			
  end
end
