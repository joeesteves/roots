class Rba::Empresagrupo < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	has_many :empresas, :dependent => :restrict
	has_many :cuentas, :class_name => "Rco::Cuenta"

end
