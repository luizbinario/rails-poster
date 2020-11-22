class UsersController < ApplicationController
	def index
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user).order("created_at desc")
		render :layout => "profile"
	end

	def create
	end
end