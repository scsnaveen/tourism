# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
        @states = CS.states(params[:country])
    @user = User.new(sign_up_params)
    @user.avatar = params[:user][:avatar]
    if @user.save
      redirect_to new_user_session_path
    else
      flash[:errors] = @user.errors.full_messages
      render 'new'
    end
  end
 def build_resource(hash={})
    super(hash.merge(ip_address: request.location))
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :address, :email, :password, :password_confirmation,:phone_number,:image,avatar: [:avatar_file_name, :avatar_content_type, :avatar_updated_at])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
