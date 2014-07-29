class Rga::Categoriatipo < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	has_and_belongs_to_many :estados, class_name: "Rga::Estado"
	has_and_belongs_to_many :eventos, class_name: "Rga::Evento"
end
