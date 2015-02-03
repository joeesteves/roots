class Rba::Empresagrupo < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	has_many :empresas, :dependent => :restrict_with_exception
	has_many :cuentas, :class_name => "Rco::Cuenta"
	has_many :establecimientos

end
