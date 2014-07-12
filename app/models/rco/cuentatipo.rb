class Rco::Cuentatipo < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  validates :codigo, uniqueness: true, presence: true
end
