module ModeloGlobales
	extend ActiveSupport::Concern

	module ClassMethods
		include ControllerGlobales
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

		def habtm(model)
			model.each do |model|
				metodo = model.to_sym
				clase = model.gsub('_','/').classify
				has_and_belongs_to_many metodo,
				:class_name => clase,
				:join_table => "rba_items_nodos",
				:association_foreign_key => "item_id"
			end
		end
		
		def habtm_nodo
			has_and_belongs_to_many :nodos, 
			:class_name => "Rba::Nodo", 
			:foreign_key => "item_id", 
			:join_table => "rba_items_nodos"			
		end			

		# filtros por id
		def deEmpresaXId(empresaId)
			where(:empresa_id => empresaId)
		end

		def deEmpresaGrupoXId(empresaId)
			where(:empresagrupo_id => empresaId)
		end

	# filtros por codigo

		def deEmpresaXCod(empresaGrupoCodigo)	
			metodo = self.name.underscore.split('/')[1].pluralize
			Rba::Empresa.find_by_codigo(empresaGrupoCodigo).send(metodo)
		end

		def deEmpresaGrupoXCod(empresaCodigo)	
			metodo = self.name.underscore.split('/')[1].pluralize
			Rba::Empresa.find_by_codigo(empresaCodigo).send(metodo)
		end
		
	end
end