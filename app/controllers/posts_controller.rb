class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
		@post = posts.new(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			flash[:error] = @post.errors.full_messages.join(", ")
			redirect_to new_post_path
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Successfully updated post."
			redirect_to post_path(@post)
		else
			flash[:notice] = @post.erros.full_messages.join(", ")
			redirect_to edit_post_path(@post)
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Successfully deleted post."
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
