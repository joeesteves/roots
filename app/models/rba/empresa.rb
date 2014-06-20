class Rba::Empresa < ActiveRecord::Base
  belongs_to :catfiscal
  belongs_to :empresagrupo
  
end
