class Rba::Empresagrupo < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	has_many :empresas, :dependent => :restrict

end
