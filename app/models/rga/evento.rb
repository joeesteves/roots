class Rga::Evento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :eventotipo
end
