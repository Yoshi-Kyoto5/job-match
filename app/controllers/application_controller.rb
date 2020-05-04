class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :img_name, :introduction, :job_name, :work_location, :work_time, :start_date, :salary, :corona_support])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :img_name, :introduction, :job_name, :work_location, :work_time, :start_date, :salary, :corona_support])
  end

  def after_sign_in_path_for(resource)
    users_path
  end
end