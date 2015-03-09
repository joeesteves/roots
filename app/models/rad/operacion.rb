class Rad::Operacion < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	validates :importe, :cuotas, :cuotaimporte, presence: { message: "no puede estar vacio"},
	numericality: { message: "debe ser un número"}
	belongs_to :operaciontipo
	belongs_to :empresa, class_name: "Rba::Empresa"
	before_destroy :liberaAsiento
	belongs_to :asiento, class_name: "Rco::Asiento", dependent: :destroy, inverse_of: :operacion
	has_many :operacionregistros, -> {order(:saldotipo)}, dependent: :destroy
	delegate :registros, :to => :asiento
	accepts_nested_attributes_for :operacionregistros, allow_destroy: true
	
	def ctasAlDebeNoGuardadasAun
		operacionregistros.select{|x| x['saldotipo'] == "debe"}
	end

	def ctasAlHaberNoGuardadasAun
		operacionregistros.select{|x| x['saldotipo'] == "haber"}
	end

	def rSave(ahAplicaciones) # ArrayHashAplicaciones [{cuenta_id: x, importe: xx.xx}]	
		rPersist('rSave',ahAplicaciones,nil)
	end

	def rUpdate(params, ahAplicaciones)
		rPersist('rUpdate', ahAplicaciones,params)	
	end

	def rPersist(caller, ahAplicaciones,params)
		return false unless valid?
		if caller == 'rUpdate'
			if update_attributes(params)
				liberaAsiento
				asiento.destroy
			else
				false
			end	
		end
		asiento = Rco::Asiento.new(:fecha => fecha, :moneda_id => 1, 
			:cotizacion =>1, :desc => 'Operacion:'  + desc, 
			:esgenerado => true, :empresa_id => empresa_id)
		case operaciontipo.codigo 
			when 1, 2, 3 # INGRESO Y COBRANZA
				aplicaAl = "aplicaciones_debe" # COBRANZA
				metodo = "reg_debe_id"
				ctas1 = ctasAlHaberNoGuardadasAun
				col1 = "haber_op".to_sym
				cta2 = ctasAlDebeNoGuardadasAun.first.cuenta_id
				col2 = "debe_op".to_sym
			when -1, -2, -3, 0	# PROVISIÓN EGRESOS	
				aplicaAl = "aplicaciones_haber" 
				metodo = "reg_haber_id"
				ctas1 = ctasAlDebeNoGuardadasAun
				col1 = "debe_op".to_sym
				cta2 = ctasAlHaberNoGuardadasAun.first.cuenta_id
				col2 = "haber_op".to_sym		
			end
		cuotasArr = cuotasArr(fecha, cuotas, importe, cuotaimporte)
		
		unless operaciontipo.codigo == 0 # - MOV. FONDOS
			if rdosxmes == false # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
				ctas1.each do |cta1|
					regAplicable = asiento.registros.new(:cuenta_id => cta1.cuenta_id, col1 => cta1.valor, :fecha => fecha)
				end
				cuotasArr.each do |k|
					asiento.registros.new(:cuenta_id => cta2, col2 => k[:valorCuota], :fecha =>  k[:fecha])
				end
			else
				cuotasArr.each do |k|
					ctas1.each do |cta1|
						asiento.registros.new(:cuenta_id => cta1.cuenta_id, col1 => cta1.valor, :fecha => k[:fecha])
					end
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
		asiento.update_columns(:esgenerado => false) if asiento.esgenerado == true
	end
end