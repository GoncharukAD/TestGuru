class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, notice: 'Вы вошли в систему'
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and password please'
      render :new  
    end  
  end 
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Вы вышли из аккаунта'
  end  
end
