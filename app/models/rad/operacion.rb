class Rad::Operacion < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :operaciontipo
  belongs_to :ctaD, class_name: "Rco:Cuenta"
  belongs_to :ctaH, class_name: "Rco:Cuenta"
  belongs_to :empresa, class_name: "Rba::Empresa"
  before_destroy :liberaAsiento
  belongs_to :asiento, class_name: "Rco::Asiento", dependent: :destroy, inverse_of: :operacion
 


  def rSave
	 	asiento = Rco::Asiento.new(:fecha => fecha, :moneda_id => 1, 
	 		:cotizacion =>1, :desc => 'Operacion:'  + desc, 
	 		:esgenerado => true, :empresa_id => empresa_id)
  	case operaciontipo.codigo
			when 1, 2	
				cta1 = ctaH_id
				col1 = "haber_op".to_s
	  		cta2 = ctaD_id
	  		col2 = "debe_op".to_s
	  	when -1,-2, 0
	  		cta1 = ctaD_id
	  		col1 = "debe_op".to_s
	  		cta2 = ctaH_id
	  		col2 = "haber_op".to_s		
		end
		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0
			if rdosxmes == false
				asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
				end
			else
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta1, col1 => k[:valorCuota], :fecha => k[:fecha])
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha => k[:fecha])
				end
			end
		else
			asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
			asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
		end	


  	asiento.transaction do
  		if asiento.valid_save
  			save
  			update_attributes(:asiento_id => asiento.id)
  		else
  			errors.add(:base, "Error al generar el asiento")
  			false
  		end	
  	end
	end

def rUpdate(params)
	if update_attributes(params)
		asiento.update_attributes(:esgenerado => false)
		asiento.destroy
		asiento = Rco::Asiento.new(:fecha => fecha, :moneda_id => 1,:cotizacion =>1, 
	 		:desc => 'Operacion:' + desc, :esgenerado => true,  :empresa_id => empresa_id)
	
		case operaciontipo.codigo
			when 1, 2	
				cta1 = ctaH_id
				col1 = "haber_op".to_s
	  		cta2 = ctaD_id
	  		col2 = "debe_op".to_s
	  	when -1,-2, 0
	  		cta1 = ctaD_id
	  		col1 = "debe_op".to_s
	  		cta2 = ctaH_id
	  		col2 = "haber_op".to_s		
		end
		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0
			if rdosxmes == false
				asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
				end
			else
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta1, col1 => k[:valorCuota], :fecha => k[:fecha])
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha => k[:fecha])
				end
			end
		else
			asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
			asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
		end	
		

		asiento.transaction do
			if asiento.valid_save
				save
				update_attributes(:asiento_id => asiento.id)
			else
				errors.add(:base, "Error al generar el asiento")
				false
			end	
		end
		true
	else
		false
	end
end


	def cuotasArr(fecha, cuotas, importe, valorCuota)
		cuotasArr = []
		cuotaAcu = 0
		cuotas.times do |c|
			valorCuota = importe - cuotaAcu if c == cuotas - 1
			cuotaAcu += valorCuota
			cuotasArr.push({fecha: fecha.advance(:months => c), valorCuota: valorCuota})
		end	
		cuotasArr
	end  

	def liberaAsiento
		asiento.update_column(:esgenerado,false)
	end
end