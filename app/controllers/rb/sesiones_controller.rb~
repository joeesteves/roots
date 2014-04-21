class Rb::SesionesController < ApplicationController
	skip_before_filter :validar_usuario

	def new
	end

	def create
		usuario = Rb::Usuario.find_by_usuario(params[:usuario])
		if usuario && usuario.authenticate(params[:password])
			session[:usuario_id] = usuario.id
			redirect_to rb_usuarios_url, :notice => "Adentro! Dijo Juan Carlos Saravia"
		else
			flash.now.alert = "Datos Invalidos, contactese con nuestros operadores"
			redirect_to root_url
		end
	end

	def salir
		session[:usuario_id] = nil
		redirect_to root_url
	end

end
