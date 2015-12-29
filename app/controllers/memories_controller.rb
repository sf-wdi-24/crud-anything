class MemoriesController < ApplicationController

	before_action :current_parent 
  before_action :current_child

  def index

  end

  def new
  	@memory = Memory.new
  end

  def create
  	@memory = Memory.new(memory_params)
  	if @memory.save
  		flash[:notice] = "You have added a memory"
  		redirect_to child_path(memory_params[:child_id])
  	else
  		flash[:error] = @memory.errors.full_messages.join(", ")
  		redirect_to child_path(memory_params[:child_id])
  	end

  end

  def show
  	
  end

  def edit
  	
  end

  def update

  end
  
  def destroy
  	
  end
  
  private
  
  def set_child
  	this_child = params[:id]
  	@child = Child.find_by_id(this_child)
  end

  def memory_params	
  	params.require(:memory).permit(:memory_date, :memory_description, :child_id)
  end

end