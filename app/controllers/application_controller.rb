# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name first_name email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name first_name email])
  end

  def after_sign_in_path_for(_resource)
    current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
