module Importador
	include ControllerGlobales
	def importarGenerico(file, entidad)
		CSV.foreach(file.path, headers: true ) do |row|
			objeto = entidad[:clase].create! row.to_hash
			unless nodo = Rba::Arbol.find_by_modelo(entidad[:path]).nil?
				nodo = Rba::Arbol.find_by_modelo(entidad[:path]).nodos.first
				nodo.send(entidad[:metodo]) << objeto
			end
		end
	end

	def importarCuentas(file, empresa_id)
		@asiento = Rco::Asiento.new({empresa_id: empresa_id, cotizacion: 1, moneda_id: 1})
		index = 0
			CSV.foreach(file.path, headers: true ) do |row|
				objeto = row.to_hash
				objeto = convCodigoToId(objeto, ["rco/cuenta", "rba/organizacion"])
				if objeto["debe"].nil?
					objeto["debe_op"] =  "0"
				else
					objeto["debe_op"] = objeto["debe"].gsub(",",".")
 				end
 				if objeto["haber"].nil?	 
 					objeto["haber_op"] = "0"
 				else
					objeto["haber_op"] = objeto["haber"].gsub(",",".")
				end
				if index == 0
					@asiento.fecha = objeto["fecha"]
					@asiento.desc = objeto["desc_global"]
				end 
				["debe","haber","desc_global"].each do |atr|
					objeto.delete(atr)
				end
				@asiento.registros.new(objeto) 
				index += 1

			end
			@asiento
			 # asiento.valid_save

	end

	def convCodigoToId(objeto, atributos)
		atributos.each do |relacion|
			entidad = getVariables(relacion)
			if relacion == "rba/organizacion"
				unless objeto[relacion].presence.nil?
					objeto[entidad[:entidad_id]] = entidad[:clase].find_by_nombre(objeto[relacion]).id
				end
			else
				objeto[entidad[:entidad_id]] = entidad[:clase].find_by_codigo(objeto[relacion]).id
			end
			objeto.delete(relacion)
		end 
		objeto
	end

end
