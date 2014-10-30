module ModeloGlobales
	extend ActiveSupport::Concern

	module ClassMethods
		include ControllerGlobales
		include Importador
		
		def importar(file, entidad, empresa_id, empresagrupo_id)
			case entidad[:path]
			when "rco/asientos"
				@rta = importarCuentas(file, empresa_id)
				return @rta
			else
				importarGenerico(file, entidad)
				return false
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


		def deEmpresaXCod(empresaCodigo)	
			# metodo = self.name.underscore.split('/')[1].pluralize
			# Rba::Empresa.find_by_codigo(empresaCodigo).send(metodo)
		end
		
		def deEmpresaGrupoXCod(empresaGrupoCodigo)	
			metodo = self.name.underscore.split('/')[1].pluralize
			Rba::Empresagrupo.find_by_codigo(empresaGrupoCodigo).send(metodo)
		end
	end
end