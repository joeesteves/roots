class Rba::BienvenidosController < ApplicationController
	skip_before_filter :validar_usuario
	def inicio

	end
end