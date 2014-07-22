class Rba::Actividad < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :actividadtipo
end
