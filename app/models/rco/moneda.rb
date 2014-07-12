class Rco::Moneda < ActiveRecord::Base
	include ModeloGlobales
  habtm_nodo
  has_many :cotizaciones
end
