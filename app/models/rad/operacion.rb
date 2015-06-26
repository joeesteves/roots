class Rad::Operacion < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	validates :importe, :cuotas, :cuotaimporte, presence: { message: "no puede estar vacio"},
	numericality: { message: "debe ser un número"}
	belongs_to :operaciontipo
	delegate :codigo, :to => :operaciontipo, :prefix => false
	belongs_to :empresa, class_name: "Rba::Empresa"
	before_destroy :liberaAsiento
	belongs_to :asiento, class_name: "Rco::Asiento", dependent: :destroy, inverse_of: :operacion
	has_many :operacionregistros, -> {order(:saldo_tipo)}, dependent: :destroy
	delegate :registros, :to => :asiento
	belongs_to :organizacion, class_name: "Rba::Organizacion"
	accepts_nested_attributes_for :operacionregistros, allow_destroy: true
	
	def ctas_debe_instancia
		operacionregistros.select{|x| x['saldo_tipo'] == "debe"}
	end

	def ctas_haber_instancia
		operacionregistros.select{|x| x['saldo_tipo'] == "haber"}
	end

	def rSave(aplicaciones_origen, aplicaciones_destino) # ArrayHashAplicaciones [{cuenta_id: x, importe: xx.xx}]	
		rPersist('rSave', nil, aplicaciones_origen, aplicaciones_destino)
	end

	def rUpdate(params, aplicaciones_origen, aplicaciones_destino)
		rPersist('rUpdate', params, aplicaciones_origen, aplicaciones_destino)	
	end

	def rPersist(caller, params, aplicaciones_origen, aplicaciones_destino)
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
		vars = Rad::Operacion.set_vars('registros', operaciontipo.codigo)		
		cuentas_origen = send(vars[:cuentas_origen])
		cuenta_destino = send(vars[:cuentas_destino]).first.cuenta_id #por ahora se permite una sola
		cuotas_array = cuotas_array(fecha, cuotas, importe, cuotaimporte)
		cuenta_destino_objeto = Rco::Cuenta.find(cuenta_destino)
		if cuenta_destino_objeto.es_tarjeta?
			organizacion_destino_id = cuenta_destino_objeto.organizacion_id
		else
			organizacion_destino_id = organizacion_id
		end

		unless operaciontipo.codigo == 0 # !MOV. FONDOS
			if rdosxmes == false
				cuentas_origen.each do |cuenta_origen|
					if cuenta_origen.valor < 0
						metodo_op_doh = vars[:inv_valor_al_metodo_op]
						valor = cuenta_origen.valor * -1
					else
						metodo_op_doh = vars[:valor_al_metodo_op]
						valor = cuenta_origen.valor
					end
					asiento.registros.new(:cuenta_id => cuenta_origen.cuenta_id, metodo_op_doh => valor, :fecha => fecha, :organizacion_id => organizacion_id)
				end
				cuotas_array.each do |k|
					asiento.registros.new(:cuenta_id => cuenta_destino, vars[:inv_valor_al_metodo_op] => k[:valorCuota], :fecha =>  k[:fecha], :organizacion_id => organizacion_destino_id)
				end
			else  # SOLO DEBERIAN SER CUENTAS DE INGRESOS O EGRESOS CONTROLADO HOY POR JS
				cuotas_array.each do |k|
					cuentas_origen.each do |cuenta_origen|
						if cuenta_origen.valor < 0
							metodo_op_doh = vars[:inv_valor_al_metodo_op]
							valor = cuenta_origen.valor * -1
						else
							metodo_op_doh = vars[:valor_al_metodo_op]
							valor = cuenta_origen.valor
						end
						asiento.registros.new(:cuenta_id => cuenta_origen.cuenta_id, metodo_op_doh => valor, :fecha => k[:fecha], :organizacion_id => organizacion_id)
					end
					asiento.registros.new(:cuenta_id => cuenta_destino, vars[:inv_valor_al_metodo_op] => k[:valorCuota], :fecha => k[:fecha], :organizacion_id => organizacion_destino_id)	
				end
			end
		else # MOV. FONDOS
			cuentas_origen.each do |cuenta_origen|
				asiento.registros.new(:cuenta_id => cuenta_origen.cuenta_id, vars[:valor_al_metodo_op] => cuenta_origen.valor, :fecha => fecha)
			end
			asiento.registros.new(:cuenta_id => cuenta_destino, vars[:inv_valor_al_metodo_op] => importe, :fecha => fecha)
		end

		asiento.transaction do
			if asiento.valid_save
				# UNA VEZ GUARDADO EL ASIENTO GUARDA LAS APLICACIONES
				#APLICACION AL ORIGEN
				unless aplicaciones_origen.nil?
					# aplicacion es un string compuesto asi :registro_id, :cuenta_id, :importe
					aplicaciones_origen.each do |aplicacion|
						aplicacion_array = aplicacion.split(', ')
						registro = asiento.registros.send('al_' + vars[:valor_al]).find_by_cuenta_id(aplicacion_array[1].to_i)
						registro.send(vars[:inv_valor_al_metodo_aplica]).create(vars[:inv_valor_al_metodo_reg].to_sym => aplicacion_array[0].to_i, :importe => aplicacion_array[2].to_f)
					end
				end
				unless aplicaciones_destino.nil?
					aplicaciones_destino.each do |aplicacion|
						aplicacion_array = aplicacion.split(', ')
						registro = asiento.registros.send('al_' + vars[:inv_valor_al]).find_by_cuenta_id(aplicacion_array[1].to_i)
						registro.send(vars[:valor_al_metodo_aplica]).create(vars[:valor_al_metodo_reg].to_sym => aplicacion_array[0].to_i, :importe => aplicacion_array[2].to_f)
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
	def cuotas_array(fecha, cuotas, importe, valorCuota)
		cuotas_array = []
		cuotaAcu = 0
		cuotas.times do |c|
			valorCuota = importe - cuotaAcu if c == cuotas - 1
			cuotaAcu += valorCuota
			cuotas_array.push({fecha: fecha.advance(:months => c), valorCuota: valorCuota})
		end	
		cuotas_array
	end  

	def liberaAsiento
		begin
			asiento.update_columns(:esgenerado => false) if asiento.esgenerado == true
		rescue
			errors.add(:base, "Ojo! El asiento del registro #{id} ya había sido eliminado")
		end
	end

	def compatibles_aplicados
		registros = {}
		origen = {}
		destino = {}

		case operaciontipo.codigo
			when -2 #[pago] 
				origen = set_compatibles_aplicados('al_debe', 'origen', origen)
	    when 2 #[cobranza]
	    	origen = set_compatibles_aplicados('al_haber', 'origen', origen)
	    when -3 #[provisión engresos]
	    	destino = set_compatibles_aplicados('al_haber', 'destino', destino)
	    when 3 #[provision ingresos] 
	    	destino = set_compatibles_aplicados('al_debe', 'destino', destino)
	    when -1 #[egreso] 
	      origen = set_compatibles_aplicados('al_debe', 'origen', origen)
				destino = set_compatibles_aplicados('al_haber', 'destino', destino)
	    when 1 #[ingreso] 
	    	origen = set_compatibles_aplicados('al_haber', 'origen', origen)
				destino = set_compatibles_aplicados('al_debe', 'destino', destino)
		end
		compatibles_aplicados_hash = {}
    compatibles_aplicados_hash['origen'] = origen
    compatibles_aplicados_hash['destino'] = destino
    compatibles_aplicados_hash
  end

  def set_compatibles_aplicados(al_debe_o_al_haber, origen_o_destino, objeto_hash)
  	objeto_hash['compatibles'] = []
  	objeto_hash['aplicados'] = []
  	objeto_hash['registros'] = registros.send(al_debe_o_al_haber)
		objeto_hash['registros'].each do |registro|
      objeto_hash['compatibles'] |= registro.compatibles[origen_o_destino]
      objeto_hash['aplicados'] |= registro.aplicados[origen_o_destino].collect(&:id)
    end
    objeto_hash
  end

  def self.set_vars(caller, codigo)
  	# callers [origen, destino] compatibles, [registro] comp unico. Se dan las var con sus inv. 
    vars = {}
    valor_al = ''
    case caller
	    when 'origen'
	      case codigo
		      when -1,-2
		        valor_al = "haber" 
		      when 1, 2
		        valor_al = "debe"
	      end
	    when 'destino'
	      case codigo
		      when -1, -3
		        valor_al = "debe"
		      when 1, 3
		        valor_al = "haber"
	      end
	    when 'registros'
	    	case codigo
		      when -1, -2, -3, 0
		        valor_al = "debe"
		      when 1, 2, 3
		        valor_al = "haber"
				end
		end

    vars[:valor_al] = valor_al
    vars[:inv_valor_al] = inversa_de(valor_al)
    vars[:valor_al_metodo_op] = (valor_al + "_op").to_sym
    vars[:valor_al_metodo_reg] = ("reg_" + valor_al + "_id").to_sym
    vars[:valor_al_metodo_reg_string] = ("reg_" + valor_al + "_id")
    vars[:inv_valor_al_metodo_op] = (inversa_de(valor_al) + "_op").to_sym
    vars[:inv_valor_al_metodo_reg] = ("reg_" + inversa_de(valor_al) + "_id").to_sym
    vars[:inv_valor_al_metodo_reg_string] = ("reg_" + inversa_de(valor_al) + "_id")
    vars[:valor_al_metodo_aplica] = "aplicaciones_" + valor_al
    vars[:inv_valor_al_metodo_aplica] = "aplicaciones_" + inversa_de(valor_al)
    vars[:registro_aplicaciones] = "aplicaciones_" + valor_al
    vars[:cuentas_origen] = 'ctas_' + valor_al + '_instancia'
    vars[:cuentas_destino] = 'ctas_' + inversa_de(valor_al) + '_instancia'
    vars
  end

  def self.inversa_de(saldo_tipo)
    case saldo_tipo
	    when 'debe'
	      'haber'
	    when 'haber'
	      'debe'
    end
  end

end