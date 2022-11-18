# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t("sessions.sign_in_message", first_name: resource.first_name, last_name: resource.last_name)
  end
end
