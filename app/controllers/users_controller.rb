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

		if Follower.where(user_id: current_user.id, follows_user: @user.id).count > 0
			@follow = true
		end

		@follows = Follower.where(follows_user: @user.id, notified: false).count
		
		render :layout => "profile"
	end

	def notifications
		@follows = Follower.where(follows_user: @user.id).count
	end

	def create
	end
end