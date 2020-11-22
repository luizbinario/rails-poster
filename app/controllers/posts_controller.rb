class PostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = User.find(params[:user_id])
		@posts = Post.order(created_at: :desc)
	end
	
	def show
		@post = Post.find(params[:id])
    end

    def new
		@posts = Post.all
    end

    def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(post_params)
		redirect_to user_posts_path(@user)
	end

    private
		def post_params
			params.require(:post).permit(:body)
		end
end
