class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
      flash[:error] = 'You are alredy logged in.'
    else
      render :new
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      flash[:notice] = 'Welcome Back'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Incorrect email or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] =  'Successfully logged out'
    redirect_to root_path
  end
end
