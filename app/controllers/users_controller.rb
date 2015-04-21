class UsersController < ApplicationController
	def show
		@user = User.find(current_user.id)
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user.id)
		if @user.update_attributes(user_params)
			flash[:success] = 'Profile updated'
			redirect_to root_url
		else
			render 'show'
		end
	end

	def update_password
    	@user = User.find(current_user.id)
    	if @user.update(user_params)
      		# Sign in the user by passing validation in case their password changed
      		sign_in @user, :bypass => true
      		redirect_to root_path
    	end
	end	



	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
