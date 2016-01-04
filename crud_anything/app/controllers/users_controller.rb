class UsersController < ApplicationController

    def index
    	@users = User.all
    	render :index
    end
	

	def new
		@user = User.new
		render :new
	end

	def create
		
		user = User.new(user_params)
		if user.save
			redirect_to '/'
		else
			flash[:error] = user.errors.full_messages.join(", ")
			redirect_to '/signup'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
