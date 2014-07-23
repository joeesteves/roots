class Rga::Estado < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
end
