class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to '/users/'+current_user.id.to_s
	end
end