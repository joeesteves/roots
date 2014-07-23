class Rga::Animal < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :madre, :foreign_key => "madre_id", :class_name => "Rga::Animal"
  belongs_to :padre, :foreign_key => "padre_id", :class_name => "Rga::Animal"
end
