class UsersController < ApplicationController
	before_action :authenticate_user!
	has_scope :past
	has_scope :upcoming

	def my_events
		if params[:request] || request.fullpath == '/user_events'
			@events = current_user.events.order("event_date DESC").paginate(page: params[:page],:per_page => 5)
		else
			@events = apply_scopes(current_user.attended_events).paginate(page: params[:page],:per_page => 5)
		end		
	end

	private

	  def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
end
