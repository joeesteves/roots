class Rba::Empresa < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_many :asientos, class_name: "Rco::Asiento"
  belongs_to :catfiscal
  belongs_to :empresagrupo

end
