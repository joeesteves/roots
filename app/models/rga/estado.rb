class Rga::Estado < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	has_and_belongs_to_many :categoriatipos, table_name: "rga_categoriatipos_estados", class_name: "Rga::Categoriatipo"
	has_many :estados_eventos, table_name: "rga_estados_eventos"
	has_many :eventos, :through => :estados_eventos

end
