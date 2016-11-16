class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

 before_filter :configure_permitted_parameters, if: :devise_controller?

 def escaped_search
   if params[:search]
     return CGI::escape(params[:search])
   else
     return ''
   end
 end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :username, :avatar]
   devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :username, :avatar]
 end
end
