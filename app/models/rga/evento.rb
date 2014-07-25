class Rga::Evento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :eventotipo
 	has_and_belongs_to_many :categoriatipos, table_name: "rga_categoriatipos_eventos", class_name: "Rga::Categoriatipo"
	has_many :origestados_eventos, -> { where codigo: ['O','OD'] }, table_name: "rga_estados_eventos", class_name: "Rga::EstadosEvento"
	has_many :destestados_eventos, -> { where codigo: ['D','OD'] }, table_name: "rga_estados_eventos", class_name: "Rga::EstadosEvento"
	has_many :estados_eventos, table_name: "rga_estados_eventos", dependent: :destroy
	has_many :origestados, :through => :origestados_eventos, :source => :estado
	has_many :destestados, :through => :destestados_eventos, :source => :estado
	has_many :estados, :through => :estados_eventos

end
