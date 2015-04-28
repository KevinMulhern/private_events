class UsersController < ApplicationController
	has_scope :upcoming
	has_scope :past
	has_scope :created_events

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

	def my_events
		if params[:request] || request.fullpath == '/user_events'
			@events = current_user.events
		else
		@events = apply_scopes(Event).all
	end
		
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
