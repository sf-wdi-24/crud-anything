class ParentsController < ApplicationController

	# Find parents ID before rendering views
	before_action :set_parent, except: [:new, :create, :index]

  def index
  end

  def new
  	if current_parent
  		redirect_to parent_path(current_parent)
  	else
  		@parent = Parent.new
  	end
  end

  def create
  	
    if current_parent
  		redirect_to parent_path(current_parent)
  	else
			@parent = Parent.new(parent_params)
			if @parent.save
				session[:parent_id] = @parent.id
				flash[:notice] = "You have successfully created an account"
        ParentMailer.delay(run_at: 1.minutes.from_now).welcome_email(@parent)
				redirect_to parent_path(@parent)
			else
				flash[:error] = @parent.errors.full_messages.join(", ")
				redirect_to new_parent_path
			end
    end
  end

  def show
  end

  def edit
  	
    unless current_parent == @parent
      redirect_to parent_path(current_parent)
    end
  end

  def update
    if current_parent == @parent
      if @parent.update_attributes(parent_params)
        flash[:notice] = "You have updated your profile"
        redirect_to parent_path(@parent)
      else
        flash[:error] = @parent.errors.full_messages.join(", ")
      end
    else
      redirect_to parent_path(current_parent)
    end
  end
  
  def destroy
    if current_parent == @parent
      @parent.destroy
      session[:parent_id] = nil
      flash[:notice] = "You have deleted your account"
      redirect_to root_path
    else
      redirect_to parent_path(current_parent)
    end
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
