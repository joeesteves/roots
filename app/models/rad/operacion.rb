class Rad::Operacion < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	validates :importe, :cuotas, :cuotaimporte, presence: { message: "no puede estar vacio"}, numericality: { message: "debe ser un número"}
	belongs_to :operaciontipo
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :asiento, class_name: "Rco::Asiento", dependent: :destroy, inverse_of: :operacion
  has_many :operacionregistros, -> {order(:saldotipo)}
  before_destroy :liberaAsiento
  delegate :registros, :to => :asiento
  accepts_nested_attributes_for :operacionregistros, allow_destroy: true
  # belongs_to :ctaD, class_name: "Rco:Cuenta"
  # belongs_to :ctaH, class_name: "Rco:Cuenta"

	
	def ctasAlDebe
		operacionregistros.where(:rad_operacionregistros => {:saldotipo => "debe"}).collect(&:cuenta_id)
	end
	def ctasAlHaber
		operacionregistros.where(:rad_operacionregistros => {:saldotipo => "haber"}).collect(&:cuenta_id)
	end

	def ctasAlDebeNoGuardadasAun
		operacionregistros.select{|x| x['saldotipo'] == "debe"}
	end
	
	def ctasAlHaberNoGuardadasAun
		operacionregistros.select{|x| x['saldotipo'] == "haber"}
	end


  def rSave(ahAplicaciones) # ArrayHashAplicaciones [{cuenta_id: x, importe: xx.xx}]
  	return false unless valid?
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
	  	when -1,-2, 0 # EGRESO, PAGO Y MOV. FONDOS
	  		aplicaAl = "aplicaciones_haber" # PAGOS
	  		metodo = "reg_haber_id"
	  		cta1 = ctaD_id
	  		col1 = "debe_op".to_sym
	  		cta2 = ctaH_id
	  		col2 = "haber_op".to_sym
  		when 3 # PROVISION INGRESO
				aplicaAl = "aplicaciones_debe" # INGRESOS
				metodo = "reg_debe_id"
				cta1 = ctaH_id
				col1 = "haber_op".to_sym
	  		cta2 = ctaD_id
	  		col2 = "debe_op".to_sym
  		# PROVISIÓN EGRESOS	
	  	when -3 
	  		aplicaAl = "aplicaciones_haber" 
	  		metodo = "reg_haber_id"
	  		cta1 = ctasAlDebeNoGuardadasAun.first.cuenta_id
	  		col1 = "debe_op".to_sym
	  		cta2 = ctasAlHaberNoGuardadasAun.first.cuenta_id
	  		col2 = "haber_op".to_sym		
		end
		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0 # - MOV. FONDOS
			if rdosxmes == false # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
				regAplicable = asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha =>  k[:fecha])
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

def rUpdate(params, ahAplicaciones)
	return false unless valid?
	if update_attributes(params)
		asiento.update_attributes(:esgenerado => false)
		asiento.destroy
		asiento = Rco::Asiento.new(:fecha => fecha, :moneda_id => 1,:cotizacion =>1, 
	 		:desc => 'Operacion:' + desc, :esgenerado => true,  :empresa_id => empresa_id)
	
		case operaciontipo.codigo
			when 1, 2	
				aplicaAl = "aplicaciones_debe" # COBRANZA
				metodo = "reg_debe_id"
				cta1 = ctaH_id
				col1 = "haber_op".to_s
	  		cta2 = ctaD_id
	  		col2 = "debe_op".to_s
	  	when -1,-2, 0
	  		aplicaAl = "aplicaciones_haber" # PAGOS
	  		metodo = "reg_haber_id"
	  		cta1 = ctaD_id
	  		col1 = "debe_op".to_s
	  		cta2 = ctaH_id
	  		col2 = "haber_op".to_s
  		when -3 # PROVISION EGRESOS
	  		aplicaAl = "aplicaciones_haber" 
	  		metodo = "reg_haber_id"
	  		cta1 = ctasAlDebe.first
	  		col1 = "debe_op".to_sym
	  		cta2 = ctasAlHaber.first
	  		col2 = "haber_op".to_sym		
		end

		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0
			if rdosxmes == false # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
				regAplicable = asiento.registros.new(:cuenta_id => cta1, col1 => importe, :fecha => fecha)
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha => k[:fecha])
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