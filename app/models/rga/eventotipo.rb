class Rga::Eventotipo < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_and_belongs_to_many :categoriatipos, table_name: "rga_categoriatipos_eventotipos"

end
