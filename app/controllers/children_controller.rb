class ChildrenController < ApplicationController
  
  before_action :current_parent 
  before_action :set_child

  def index

  end

  def new
  	@child = Child.new
  end

  def create
  	@child = current_parent.children.new(child_params)
  	if @child.save
  		flash[:notice] = "You have added your child"
  		redirect_to child_path(@child)
  	else
  		flash[:error] = @child.errors.full_messages.join(", ")
  		redirect_to new_child_path
  	end
  end

  def show
  	# show individual child, add memories
  end

  def edit
  	# access from parent profile page
  end

  def update

  end
  
  def destroy
  	# remove child?
  end
  
  private

  def child_params
  	params.require(:child).permit(:child_first_name, :child_last_name, :birthday, :gender, :parent_id)
  end

  def set_child
  	child_id = params[:id]
  	@child = Child.find_by_id(child_id)
  end

end