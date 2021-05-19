class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:states]
	before_action :set_user, except:[:states]
	# for updating profile pictures
	def update_profile_pic
		if request.put?
			# checking if image is present
			if params[:user][:avatar].present?
				@user.avatar = params[:user][:avatar]
			end
			# checking if image is present
			if params[:user][:image].present?
				@user.image = params[:user][:image]
			end
			@user.save!
		end
	end
	# displaying paperclip image
	def secure_image
		send_file current_user.avatar.path
	end
	# setting user before action
	def set_user
		@user = User.find(current_user.id)
	end
end
