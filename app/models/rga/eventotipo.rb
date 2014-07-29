class Rga::Eventotipo < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_many :eventos, dependent: :restrict
  has_and_belongs_to_many :categoriatipos

end
