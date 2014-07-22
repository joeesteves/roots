class Rba::Campana < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :temporada
  belongs_to :campanatipo
end
