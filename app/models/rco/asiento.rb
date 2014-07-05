class Rco::Asiento < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  has_many :registros
  accepts_nested_attributes_for :registros, allow_destroy: true
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :moneda
end
