class Rba::Arbol < ActiveRecord::Base
  include ModeloGlobales
  has_many :nodos, :dependent => :destroy
  belongs_to :model
  validates :modelo, :nombre, uniqueness: true
end
