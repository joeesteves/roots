module Habtmnodo
	extend ActiveSupport::Concern

	module ClassMethods
		def habtm_nodo
			has_and_belongs_to_many :nodos, 
			:class_name => "Rba::Nodo", 
			:foreign_key => "item_id", 
			:join_table => "rba_items_nodos"			
		end	
	end
end
