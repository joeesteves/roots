	class Api::Rba::SesionesController < ApplicationController
		skip_before_filter :validar_usuario
		
		def index
			respond_with Rco::Cuenta.all
		end

		def create
			usuario = Rba::Usuario.find_by_usuario(params[:usuario])
			if usuario && usuario.authenticate(params[:password])
				session[:usuario_id] = usuario.id
				cookies[:usuario_nombre] = usuario.nombre
				session[:empresagrupo_id] = params[:empresagrupo]
				session[:empresa_id] =  Rba::Empresagrupo.find(params[:empresagrupo]).empresas.first.id
				establecimientos = Rba::Empresagrupo.find(params[:empresagrupo]).establecimientos
				session[:establecimiento_id] = establecimientos.first.id
			else
				reset_session
				render nothing: true, status: :forbidden and return
			end

				cookies[:probando] = 'seguarda?'
				render nothing: true
		end

		def salir
			reset_session
			cookies[:usuario_nombre] = nil
			render nothing: true
		end
	end
