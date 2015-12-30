class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
      flash[:alert] = "You are alredy logged in."
    else
      render :new
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to user_path(current_user)
      flash[:success] = "Welcome Back"
    else
      redirect_to login_path
      flash[:danger] = 'Incorrect email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] =  'Successfully logged out'
    redirect_to root_path
  end
end
