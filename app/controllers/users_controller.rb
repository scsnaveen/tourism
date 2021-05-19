class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:states]
	before_action :set_user, except:[:states]
	# for updating profile pictures
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
	# displaying image securely
	def secure_image
		send_file current_user.avatar.path
	end
	# setting user before action
	def set_user
		@user = User.find(current_user.id)
	end
end
