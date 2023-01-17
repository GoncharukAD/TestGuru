class FeedbackMailer < ApplicationMailer
  ADMIN_EMAIL = "goncharuk.work@gmail.com"

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL
  end
end
