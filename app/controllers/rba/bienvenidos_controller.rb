class Rba::BienvenidosController < ApplicationController
	skip_before_filter :validar_usuario
	def index
			render :layout => false	
	end
end
