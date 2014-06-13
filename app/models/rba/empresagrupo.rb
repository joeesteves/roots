class Rba::Empresagrupo < ActiveRecord::Base
	has_many :empresas, :dependent => :restrict
end
