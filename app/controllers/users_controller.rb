class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  before_action :authorize, only:[:edit, :update]

  def new
    #redirects to user profile if user is logged in
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    #prevents a user to create another acct while logged in
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = 'Successfully signed up'
        redirect_to photos_path
      else
        flash[:error] = @user.errors.full_messages.join(', ')
        redirect_to signup_path
      end
    end
  end

  def edit
    #only current user can edit their own profile
    unless current_user = @user
      redirect_to user_path(@user)
    end
  end

  def update
    #only current user can update their own profile
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = 'Profile successfully updated'
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.join(', ')
        redirect_to edit_user_path(@user)
      end
    end
  end

  def destroy
    #only current user can delete own account
    if current_user == @user
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = 'Profile successfully deleted'
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end

  def show
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
