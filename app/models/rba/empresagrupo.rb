class Rba::Empresagrupo < ActiveRecord::Base
	include Habtmnodo
	has_many :empresas, :dependent => :restrict
	habtm_nodo

end
