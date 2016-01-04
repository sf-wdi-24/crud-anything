class SessionsController < ApplicationController

  def new

  end

  def create
  	@parent = Parent.find_by_email(parent_params[:email])
  	if @parent && @parent.authenticate(parent_params[:password])
  		session[:parent_id] = @parent.id
  		flash[:notice] = "You are signed in"
  		redirect_to parent_path(@parent)
  	else
  		flash[:error] = "Incorrent login information. Please try again."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:parent_id] = nil
  	flash[:notice] = "You have logged out"
  	redirect_to root_path
  end

end

private

  def parent_params
  	params.require(:parent).permit(:email, :password)
  end
