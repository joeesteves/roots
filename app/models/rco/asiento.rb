class Rco::Asiento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :moneda
end
