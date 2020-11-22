class NotificationsController < ApplicationController
	before_action :authenticate_user!
	def index
		require 'date'

		@user = User.find(params[:user_id])
		@count = Follower.where(follows_user: current_user.id, notified: false).count
		@notifications = Follower.where(follows_user: current_user.id).order(created_at: :desc)
		
		#Atualizando status do follow como notificado
		if @count > 0
			follow = Follower.where(follows_user: current_user.id, notified: false).update_all(notified: true)
			# follow.notified = true
			# follow.save
		end

		render :layout => "profile"
	end
end