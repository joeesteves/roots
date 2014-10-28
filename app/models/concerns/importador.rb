module Importador
	def importarGenerico(file, entidad)
		CSV.foreach(file.path, headers: true ) do |row|
			objeto = entidad[:clase].create! row.to_hash
			unless nodo = Rba::Arbol.find_by_modelo(entidad[:path]).nil?
				nodo = Rba::Arbol.find_by_modelo(entidad[:path]).nodos.first
				nodo.send(entidad[:metodo]) << objeto
			end
		end
	end
	def importarCuentas(file, entidad, empresa_id)
		asiento = Rco::Asiento.new({empresa_id: empresa_id,cotizacion: 1, moneda_id: 1})
			index = 0
			CSV.foreach(file.path, headers: true ) do |row|
				objeto = row.to_hash
				cuenta_codigo = objeto["cuenta_codigo"]
				cuenta_id = Rco::Cuenta.find_by_codigo(cuenta_codigo).id
				objeto[:cuenta_id] = cuenta_id
				objeto["debe_op"] = objeto["debe"]
				objeto["haber_op"] = objeto["haber"]
				objeto.delete("cuenta_codigo").delete("debe").delete("haber")
				asiento.fecha = objeto["fecha"] if index == 0
				asiento.registros.new(objeto) 
				index += 1
			end
			asiento.valid_save
	end

end
