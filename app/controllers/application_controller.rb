class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  # skip_before_action :verify_authenticity_token, if: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :status, :img_name, :introduction, :job_name, :work_location, :work_time, :start_date, :salary, :corona_support])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :status, :img_name, :introduction, :job_name, :work_location, :work_time, :start_date, :salary, :corona_support])
  end

  def after_sign_in_path_for(resource)
    users_path
  end
end