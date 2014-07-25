class Rga::Categoriatipo < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	has_and_belongs_to_many :estados, table_name: "rga_categoriatipos_estados", class_name: "Rga::Estado"
	has_and_belongs_to_many :eventos, table_name: "rga_categoriatipos_eventos", class_name: "Rga::Evento"
end
