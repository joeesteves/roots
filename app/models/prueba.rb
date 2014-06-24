class Prueba < ActiveRecord::Base
  has_and_belongs_to_many :nodos, :foreign_key => "item_id", :join_table => "rba_items_nodos"

end
