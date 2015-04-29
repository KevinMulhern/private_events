class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	#has_scope :upcoming
	#has_scope :past

	def index
		if request.fullpath == '/events'
			@events = Event.all.order('eventDate DESC').paginate(page: params[:page], :per_page => 6)
		else
			puts request.fullpath
		 	#@events = apply_scopes(Event).all.paginate(page: params[:page], :per_page => 6)
		end
	end

	def show
		@event = Event.find(params[:id])
		@guests = @event.guests
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.new(event_params)
		if @event.save
			flash[:notice] = "Event Created"
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:notice] = "Event updated"
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:notice] = "Event Deleted"
    	redirect_to events_path
	end

	private

	  def event_params
		params.require(:event).permit(:title, :description, :location, :eventDate, :startTime)
	  end
end
