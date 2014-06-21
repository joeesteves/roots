module Habtm
	extend ActiveSupport::Concern

	module ClassMethods
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
	end
end
