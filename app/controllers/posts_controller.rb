class PostsController < ApplicationController

	before_filter :get_trip

	def get_trip
		@trip = Trip.find(params[:trip_id])
	end

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new(:trip => @trip)
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to trip_post_path(@trip, @post)
		else
			flash[:error] = @post.errors.full_messages.join(", ")
			redirect_to new_trip_post_path
		end
	end

	def show
		post_id = params[:id]

		@post = Post.find_by_id(post_id)
	end

	def edit
		post_id = params[:id]

		@post = Post.find_by_id(post_id)
	end

	def update
		post_id = params[:id]

		@post = Post.find_by_id(post_id)

		if @post.update_attributes(post_params)
			flash[:notice] = "Successfully updated post."
			redirect_to trip_post_path(@trip, @post)
		else
			flash[:notice] = @post.erros.full_messages.join(", ")
			redirect_to edit_trip_post_path(@trip, @post)
		end
	end

	def destroy
		post_id = params[:id]

		@post = Post.find_by_id(post_id)

		@post.destroy
		flash[:notice] = "Successfully deleted post."
		redirect_to trip_path(@trip)
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def set_post
		post_id = params[:id]
		@post = Post.find_by_id(post_id)
	end
end
