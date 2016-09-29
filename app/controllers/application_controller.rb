class ApplicationController < ActionController::Base
	before_filter :update_sanitized_params, if: :devise_controller?

	def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name])
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
