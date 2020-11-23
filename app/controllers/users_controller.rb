class UsersController < ApplicationController
	def index
		if params[:id]
			@user = User.find(params[:id])
		else
			if current_user
				@user = current_user.id
			else
				redirect_to "/"
			end
		end
	end

	def new
		@user = User.new
	end

	def show
		if params[:id]
			@user = User.find_by_id(params[:id])
			redirect_to("/") unless @user
		else
			if current_user
				@user = current_user.id
			else
				redirect_to "/"
			end
		end

		@posts = Post.where(user_id: @user).order("created_at desc")

		if current_user
			if Follower.where(user_id: current_user.id, follows_user: @user.id).count > 0
				@follow = true
			end
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