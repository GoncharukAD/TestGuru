# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end
end
