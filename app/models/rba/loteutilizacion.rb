class Rba::Loteutilizacion < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :lote
  belongs_to :campana
  belongs_to :actividad
end
