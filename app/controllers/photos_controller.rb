class PhotosController < ApplicationController
  before_action :set_photos, except: [:new, :create, :index]
  before_action :authorize, except: [:show, :index]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id 
    if @photo.save
      flash[:notice] = 'Photo has been created'
      redirect_to photos_path
    else
      flash[:error] = @photos.errors.full_messages.join(', ')
      redirect_to new_photo_path
    end
  end

  def destroy
    if current_user.id == @photo.user_id
      @photo.destroy
      flash[:notice] = 'Photo has been deleted'
      redirect_to photos_path
    else
      flash[:alert] = 'Something went wrong, try again'
      redirect_to photo_path(@photo)
    end
  end

  def index
    @photos = Photo.all 
    @categories = Category.all
  end

  def edit
    unless current_user.id == @photo.user_id
      redirect_to photos_path
    end
  end

  def update
    if current_user.id == @photo.user_id
      if @photo.update(photo_params)
        flash[:notice] = 'Photo has been updated'
        redirect_to photo_path(@photo)
      else
        flash[:error] = @photo.errors.full_messages.join(', ')
        redirect_to edit_photo_path(@photo)
      end
    else
      redirect_to user_path(@photo.user_id)
    end
  end

  def show
  end

private

  def set_photos
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :photo, :description, :user_id, :category_id)
  end
end
