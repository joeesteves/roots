class Rba::Arbol < ActiveRecord::Base
  has_many :nodos
  belongs_to :model

end
