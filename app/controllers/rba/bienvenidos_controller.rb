class Rba::BienvenidosController < ApplicationController
	skip_before_filter :validar_usuario
	
	def inicio
		if params[:url]
			@url = params[:url]
		end

	end
end