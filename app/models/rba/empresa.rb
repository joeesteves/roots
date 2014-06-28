class Rba::Empresa < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :catfiscal
  belongs_to :empresagrupo

end
