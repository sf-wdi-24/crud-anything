class ParentsController < ApplicationController

	# Find parents ID before rendering views
	before_action :set_parent, except: [:new, :create, :index]

  def index
  	# remove this view? change root to another page?
  end

  def new
  	@parent = Parent.new
  end

  def create
  	@parent = Parent.new(parent_params)
  	if @parent.save
  		session[:parent_id] = @parent.id
  		flash[:notice] = "You have successfully created an account"
  		redirect_to parent_path(@parent)
  	else
  		flash[:error] = @parent.errors.full_messages.join(", ")
  		redirect_to new_parent_path
  	end
  end

  def show
  	# profile page
  	# get session info before loading
  end

  def edit
  	# change parent account info, not add remove kids?
  end

  def update

  end
  
  def destroy

  end

  private

  def parent_params
  	params.require(:parent).permit(:email, :parent_first_name, :parent_last_name, :password)
  end

  def set_parent
  	# get parent before each page load
  	parent_id = params[:id]
  	@parent = Parent.find_by_id(parent_id)
  end

end
