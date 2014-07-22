class Rba::Temporada < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
end
