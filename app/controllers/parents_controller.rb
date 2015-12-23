class ParentsController < ApplicationController

	# Find parents ID before rendering views
	before_filter :get_parent, except: [:new, :create, :index]

  def index
  	# Check for signed in user
  	# Turn this into profile page?
  end

  def new
  	@parent = Parent.new
  	# redirect to new parent profile page after creation
  end

  def create
  	@parent = Parent.new(parent_params)
  	if @parent.save
  		flash[:notice] = "You have successfully created an account"
  		redirect_to parent_path(@parent)
  	else
  		flash[:error] = @parent.errors.full_messages.join(", ")
  		redirect_to new_parent_path
  	end

  end

  def show
  	# Not showing all parents, maybe indivudual parents
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
  	params.require(:parent).permit(:email, :first_name, :last_name, :password)
  end

  def get_parent
  	
  	# get params for parent
  	@parent = Parent.find_by_id(params[:id])

  end
end
