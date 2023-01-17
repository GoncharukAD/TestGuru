class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def create
    FeedbackMailer.create(params[:message]).deliver_now
    flash.now[:notice] = t(".success")
    render :index
  end
end
