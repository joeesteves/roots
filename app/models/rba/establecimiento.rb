class Rba::Establecimiento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	has_many :lotes
  accepts_nested_attributes_for :lotes, allow_destroy: true


end
