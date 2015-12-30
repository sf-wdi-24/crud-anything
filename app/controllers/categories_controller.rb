class CategoriesController < ApplicationController
  before_action :set_category, except: [:new, :create]
  before_action :authorize, except: [:show]

  #only allow users that are logged in to do any of these actions
  #except to view images in each category
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'New category added'
      redirect_to photos_path
    else
      flash[:error] = @category.errors.full_messages.join(', ')
      redirect_to new_category_path
    end
  end

  def edit
    #edit photos through category
    @photos = @category.photos
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category successfully updated'
      redirect_to photos_path
    else
      flash[:error] = @category.errors.full_messages.join(', ')
      redirect_to edit_category_path
    end
  end
  
  ##disabling the delete function for category. will be adding an admin role to manage categories

  # def destroy
  #   if @category.destroy
  #     flash[:notice] = 'Category deleted'
  #     redirect_to photos_path
  #   end
  # end


  def show
    #show photos in that are in these categories
    @categories = Category.all 
    @photos = @category.photos
  end

private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
