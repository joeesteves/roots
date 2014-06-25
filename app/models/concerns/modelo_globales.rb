module ModeloGlobales
	extend ActiveSupport::Concern


		module ClassMethods
			include Globales
			def importar(file, controller_path)
				v = getVariables(controller_path)	  	
				CSV.foreach(file.path, headers: true ) do |row|
					objeto = v[:clase].create! row.to_hash
					unless nodo = Rba::Arbol.find_by_modelo(controller_path).nil?
						nodo = Rba::Arbol.find_by_modelo(controller_path).nodos.first
						nodo.send(v[:metodo]) << objeto
					end
				end
			end		
		end
end