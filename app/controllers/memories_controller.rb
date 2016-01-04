class MemoriesController < ApplicationController

	before_action :current_parent 
  before_action :current_child
  before_action :set_child, except: [:new, :create]

  def index

  end

  def new
  	@memory = Memory.new
  end

  def create
  	@memory = current_parent.memories.new(memory_params)
    @child = Child.find_by_id(memory_params[:child_id])
  	if @memory.save
      if @memory.send_email
    		flash[:notice] = "You have added a memory and will receive an email on #{(@memory.memory_date + 365).strftime("%B %d, %Y")}"
        year_later = @memory.memory_date + 365
        ParentMailer.delay(run_at: year_later).memory_mailer(current_parent, @child, @memory)
      end
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
		if @memory.update_attributes(memory_params)
			flash[:notice] = "You have updated #{@child.child_first_name}'s information"
      if @memory.send_email
        year_later = @memory.memory_date + 365
        ParentMailer.delay(run_at: year_later).memory_mailer(current_parent, @child, @memory)
      end
			redirect_to child_path(@child)
		else
			flash[:error] = @child.errors.full_messages.join(", ")
			redirect_to edit_child_path(@child)
		end
  end
  
  def destroy
  	if current_parent
  	  @memory.destroy
      flash[:notice] = "You have removed this memory from #{@child.child_first_name}'s profile"
  		redirect_to parent_path(current_parent)
  	else
  		flash[:error] = @memory.errors.full_messages.join(", ")
  	end
  end
  
  private
  
  def set_child
  	@memory = Memory.find_by_id(params[:id])
  	@child = Child.find_by_id(@memory.child_id)
  end

  def memory_params	
  	params.require(:memory).permit(:memory_date, :memory_description, :child_id, :send_email, :send_date)
  end

end