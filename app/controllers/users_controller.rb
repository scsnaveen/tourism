	require "open-uri"

class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:states]
	before_action :set_user, except:[:states]
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
	def states
		puts "--------"
		@states = CS.states(params[:country])
		puts @states
    	respond_to do |format|
			format.js {render :json=>@states}
		end
	end
	
def secure_image
  send_file current_user.avatar.path
end
	def set_user
		@user = User.find(current_user.id)
	end
end
