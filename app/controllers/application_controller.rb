class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
    
   devise_parameter_sanitizer.for(:sign_up) << :licenseno
   devise_parameter_sanitizer.for(:account_update) << :licenseno
   devise_parameter_sanitizer.for(:sign_up) << :aop
   devise_parameter_sanitizer.for(:account_update) << :aop
   devise_parameter_sanitizer.for(:sign_up) << :lastname
   devise_parameter_sanitizer.for(:account_update) << :lastname
   devise_parameter_sanitizer.for(:sign_up) << :il
   devise_parameter_sanitizer.for(:account_update) << :il
   devise_parameter_sanitizer.for(:sign_up) << :unvan
   devise_parameter_sanitizer.for(:account_update) << :unvan
   devise_parameter_sanitizer.for(:sign_up) << :tckimlikno
   devise_parameter_sanitizer.for(:account_update) << :tckimlikno
   devise_parameter_sanitizer.for(:sign_up) << :okulveyil
   devise_parameter_sanitizer.for(:account_update) << :okulveyil
   devise_parameter_sanitizer.for(:sign_up) << :gsm
   devise_parameter_sanitizer.for(:account_update) << :gsm
 end

  
end

 