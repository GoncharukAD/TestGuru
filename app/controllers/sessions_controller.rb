class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Вы вошли в систему'
      redirect_to cookies[:start_page] || root_path
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and password please'
      render :new  
    end  
  end 
  
  def destroy
    session.delete(:user_id)
    flash.now[:notice] = 'Вы вышли из аккаунта'
    redirect_to root_path
  end  
end
