class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user[:id]
      redirect_to root_path, notice: 'You are logged in'
    else
      flash.now.alert = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: 'You logged out!'
  end
end
