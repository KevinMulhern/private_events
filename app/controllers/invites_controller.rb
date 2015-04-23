class InvitesController < ApplicationController
  def create
  	@event = Event.find(params[:invite][:event_id])
  	current_user.invites.create(event_id: @event.id)
  	redirect_to(:back)
  end

  def destroy
  	@invite = Invite.find(params[:id])
  	current_user.invites.destroy(@invite)
  	redirect_to(:back)
  end
end
