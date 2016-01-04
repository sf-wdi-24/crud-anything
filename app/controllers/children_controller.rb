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
  		flash[:notice] = "You have added #{@child.child_first_name}"
  		redirect_to child_path(@child)
  	else
  		flash[:error] = @child.errors.full_messages.join(", ")
  		redirect_to new_child_path
  	end
  end

  def show
  	unless current_parent == @child.parent
  		redirect_to root_path
  	end
  end

  def edit
  	unless current_parent == @child.parent
  		redirect_to login_path
  	end
  end

  def update
  	if current_parent == @child.parent
  		if @child.update_attributes(child_params)
  			flash[:notice] = "You have updated #{@child.child_first_name}'s information"
  			redirect_to child_path(@child)
  		else
  			flash[:error] = @child.errors.full_messages.join(", ")
  			redirect_to edit_child_path(@child)
  		end
  	else
  		redirect_to parent_path(current_parent)
  	end
  end
  
  def destroy
  	if current_parent == @child.parent
  		@child.destroy
  		flash[:notice] = "You have removed #{@child.child_first_name} from your account"
  		redirect_to parent_path(current_parent)
  	else
  		flash[:error] = @child.errors.full_messages.join(", ")
  	end
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