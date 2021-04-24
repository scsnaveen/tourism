	require "open-uri"

class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
	def show
	end
	def update_profile_pic
		if request.put?
			if params[:user][:avatar].present?

				@user.avatar = params[:user][:avatar]
			end
			if params[:user][:image].present?
				@user.image = params[:user][:image]
			end
			@user.save!
		end
	end
	def secure_image
  send_file @user.avatar.path
end
	def set_user
		@user = User.find(current_user.id)
	end
end
