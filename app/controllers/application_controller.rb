class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :validar_usuario, :conArbol

	def conArbol
		if action_name == 'index'
			 @conArbol = Rba::Arbol.exists?(:modelo => controller_path)
		end
	end

	def validar_usuario
		url = request.original_url 
		
		if session[:usuario_id] == nil 
			redirect_to root_url + '?url='+ url
		else 				
			@usuario_actual ||= Rba::Usuario.find(session[:usuario_id]) 
		end
	end	

end
