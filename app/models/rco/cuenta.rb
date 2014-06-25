class Rco::Cuenta < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :cuentatipo
  belongs_to :empresagrupo, :class_name => "Rba::Empresagrupo"
  
end
