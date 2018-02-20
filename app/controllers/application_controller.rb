class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :login
  rescue_from CanCan::AccessDenied do |exception|
  	render 'landing_page/unauthorized'
  end
  protected

  def login
  	@user = User.new
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_number, :department, :rank])
  end
end
