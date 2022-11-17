# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :first_name, :email])
  end

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
    #current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end
end
