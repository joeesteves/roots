class Rba::Arbol < ActiveRecord::Base
  has_many :nodos, :dependent => :destroy
  belongs_to :model
  validates :modelo, :nombre, uniqueness: true

end
