class Rba::Usuario < ActiveRecord::Base
	has_secure_password
  has_and_belongs_to_many :nodos, :foreign_key => "item_id", :join_table => "rba_items_nodos"
	validates_uniqueness_of :usuario
	validates_presence_of :usuario, :nombre, :apellido, :mail
	validates_presence_of :password, :on => :create
  has_and_belongs_to_many :nodos, :foreign_key => "item_id", :join_table => "rba_items_nodos"

end
