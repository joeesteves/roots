class Rba::Usuario < ActiveRecord::Base
	include ModeloGlobales
	habtm_nodo
	has_secure_password
	validates_uniqueness_of :usuario
	validates_presence_of :usuario, :nombre, :apellido, :mail
	validates_presence_of :password, :on => :create
end
