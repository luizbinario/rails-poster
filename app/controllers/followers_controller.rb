class FollowersController < ApplicationController
	before_action :authenticate_user!
	def create
		@user = User.find(current_user.id)
		@followed = follower_params[:follows_user]
		@follower = @user.followers.create(follower_params)
		redirect_to user_path(@followed)
	end

	private
		def follower_params
			params.require(:follower).permit(:follows_user)
		end
end