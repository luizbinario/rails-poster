class NotificationsController < ApplicationController
	before_action :authenticate_user!
	def index
		require 'date'

		@user = User.find(params[:user_id])
		@follows_count = Follower.where(follows_user: current_user.id, notified: false).count
		@notifications = Follower.where(follows_user: current_user.id).order(created_at: :desc)
		
		#Atualizando status do follow como notificado
		if @follows_count > 0
			follow = Follower.where(follows_user: current_user.id, notified: false).update_all(notified: true)
		end

		render :layout => "profile"
	end
end