class Rad::Operacion < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  validates :importe, :cuotas, :cuotaimporte, presence: true
  belongs_to :operaciontipo
  belongs_to :ctaD, class_name: "Rco:Cuenta"
  belongs_to :ctaH, class_name: "Rco:Cuenta"
  belongs_to :empresa, class_name: "Rba::Empresa"
  before_destroy :liberaAsiento
  belongs_to :asiento, class_name: "Rco::Asiento", dependent: :destroy, inverse_of: :operacion
  delegate :registros, :to => :asiento

  def rSave(ahAplicaciones) # ArrayHashAplicaciones [{cuenta_id: x, importe: xx.xx}]
	 	asiento = Rco::Asiento.new(:fecha => fecha, :moneda_id => 1, 
	 		:cotizacion =>1, :desc => 'Operacion:'  + desc, 
	 		:esgenerado => true, :empresa_id => empresa_id)
  	case operaciontipo.codigo
			# INGRESO Y COBRANZA
			when 1, 2
				aplicaAl = "aplicaciones_debe" # COBRANZA
				metodo = "reg_debe_id"
				cta1 = ctaH_id
				col1 = "haber_op".to_sym
	  		cta2 = ctaD_id
	  		col2 = "debe_op".to_sym
  		# EGRESO, PAGO Y MOV. FONDOS	
	  	when -1,-2, 0
	  		aplicaAl = "aplicaciones_haber" # PAGOS
	  		metodo = "reg_haber_id"
	  		cta1 = ctaD_id
	  		col1 = "debe_op".to_sym
	  		cta2 = ctaH_id
	  		col2 = "haber_op".to_sym		
		end
		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0 # - MOV. FONDOS
			if rdosxmes == false # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
				regAplicable = asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
				end
			else
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta1, col1 => k[:valorCuota], :fecha => k[:fecha])
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha => k[:fecha])
				end
			end
		else # MOV. FONDOS
			asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
			asiento.registros.new(:cuenta_id => cta2, col2 => importe, :fecha => fecha)
		end	

  	asiento.transaction do
  		if asiento.valid_save
  			# UNA VEZ GUARDADO EL ASIENTO GUARDA LAS APLICACIONES
  			unless ahAplicaciones.nil?
	  			ahAplicaciones.each do |aplicacion|
	  				aplicacion = aplicacion.split(', ')
						regAplicable.send(aplicaAl).create(metodo.to_sym => aplicacion[0].to_i, :importe => aplicacion[1].to_f)
					end
  			end
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
			if rdosxmes == false # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
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

# FX PARA EL CALCULO DE CUENTAS
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