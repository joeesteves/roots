class Rba::Lote < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :establecimiento
end
