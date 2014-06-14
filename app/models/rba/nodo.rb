class Rba::Nodo < ActiveRecord::Base
  belongs_to :arbol
  has_and_belongs_to_many :empresas,
:class_name => "Rba::Empresa",
:join_table => "rba_items_nodos",
:association_foreign_key => "item_id"

end
