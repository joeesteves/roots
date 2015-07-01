class Rba::SesionesController < ApplicationController
	skip_before_filter :validar_usuario

	def new
	end

	def create

		usuario = Rba::Usuario.find_by_usuario(params[:usuario])
		if usuario && usuario.authenticate(params[:password])
			session[:usuario_id] = usuario.id
			session[:empresagrupo_id] = params[:empresagrupo]
			session[:empresa_id] =  Rba::Empresagrupo.find(params[:empresagrupo]).empresas.first.id
			establecimientos = Rba::Empresagrupo.find(params[:empresagrupo]).establecimientos
			session[:establecimiento_id] = establecimientos.first.id   
			if params[:url] != ''
				redirect_to params[:url]
			else
				redirect_to rco_eerrs_url, :notice => "Adentro!"
			end
		else
			redirect_to root_url, :notice => "Usuario ó contraseña incorrectos"
		end
	end

	def actualizaSesion
		@modelo = params[:modelo]
		case @modelo
		when "empresa"
			session[:empresa_id] = params[:id]
			@nuevoNombre = Rba::Empresa.find(params[:id]).nombre
		when "establecimiento"
			session[:establecimiento_id] = params[:id]
			@nuevoNombre = Rba::Establecimiento.find(params[:id]).nombre
		end

		respond_to do |format|
			format.js
		end
	end

	def salir
		reset_session
		
		redirect_to root_url
	end

end
