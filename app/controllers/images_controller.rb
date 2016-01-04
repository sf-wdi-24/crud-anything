class ImagesController < ApplicationController

	before_filter :get_trip

	def get_trip
		if params.has_key?(:trip_id)
			@trip = Trip.find(params[:trip_id])
		end
	end

	def index
		@images = Image.all
	end

	def new 
		@image = Image.new(:trip => @trip)
	end

	def create
		@image = Image.new(image_params)
		@image.trip = @trip

		if @image.save
			redirect_to trip_path(@trip)
		else
			flash[:error] = @image.errors.full_messages.join(", ")
			redirect_to new_trip_image_path(@trip)
		end
	end

	def show
		image_id = params[:id]

		@image = Image.find_by_id(image_id)
	end

	def edit
		image_id = params[:id]

		@image = Image.find_by_id(image_id)
	end

	def update
		image_id = params[:id]

		@image = Image.find_by_id(image_id)

		if @image.update_attributes(image_params)
			flash[:notice] = "Successfully updated image."
			redirect_to image_path(@image)
		else
			flash[:notice] = @image.errors.full_messages.join(", ")
			redirect_to edit_image_path(@image)
		end
	end

	def destroy
		image_id = params[:id]

		@image = Image.find_by_id(image_id)

		@image.destroy
		flash[:notice] = "Successfully deleted image."
		if @trip
			redirect_to trip_path(@trip)
		else
			redirect_to images_path
		end
	end

	private

	def image_params
		params.require(:image).permit(:attachment, :title)
	end

	def set_image
		image_id = params[:id]
		@image = Image.find_by_id(image_id)
	end
end
