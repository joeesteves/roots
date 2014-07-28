class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :validar_usuario, :conArbol
	include ControllerGlobales
	

	def conArbol
		unless request.format == 'application/json'
			if action_name == 'index'
				 @conArbol = Rba::Arbol.exists?(:modelo => controller_path)
			end
		end
	end

	def validar_usuario
		unless request.format == 'application/json'
			url = request.original_url 
			
			if session[:usuario_id] == nil 
				redirect_to root_url + '?url='+ url
			else 				
				@usuario_actual ||= Rba::Usuario.find(session[:usuario_id]) 
				@e_grupo_actual = Rba::Empresagrupo.find(session[:empresagrupo_id])
				@empresa_actual = Rba::Empresa.find(session[:empresa_id])

			end
		end
	end	

end
