class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :validar_usuario

	def validar_usuario
		if session[:usuario_id] == nil 
			redirect_to new_rb_sesion_path
		else 				
			@usuario_actual ||= Rb::Usuario.find(session[:usuario_id]) 
		end
	end	

end
