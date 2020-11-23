class UsersController < ApplicationController
	def index
		if params[:search]
			@users_search = "1237"
		else
			@user = User.find(params[:id])
		end
	end

	def new
		@user = User.new
	end

	def show
		if not params[:search]
			@user = User.find(params[:id])
		else
			@user = User.find(current_user.id)
		end

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

	def search
		@follows = Follower.where(follows_user: current_user.id, notified: false).count

		@user = User.find(current_user.id)
		@users_search = User.where("name LIKE ?", "%"+params[:search]+"%")
		render :layout => "profile"
	end
end