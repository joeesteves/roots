class Rba::Empresa < ActiveRecord::Base
  include Habtmnodo
  habtm_nodo
  belongs_to :catfiscal
  belongs_to :empresagrupo
end
