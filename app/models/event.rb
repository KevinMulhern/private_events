class Event < ActiveRecord::Base
	belongs_to :host, class_name: 'User'
	has_many :guests, through: :invites
	has_many :invites, :foreign_key => 'attended_event_id'



	validates :title, presence: true, length: { maximum: 40 }
	validates :description, presence: true, length: {minimum: 5}
	validates :location, presence: true, length: { minimum: 3}
	validates :event_date, presence: true
	validates :start_time, presence: true
	validate :event_date_cannot_be_in_the_past

	scope :upcoming, -> event_date { where("event_date >= ?", Date.today).order("event_date ASC") }
	scope :past, -> event_date { where("event_date < ?", Date.today).order("event_date DESC") }


	 def event_date_cannot_be_in_the_past
    	errors.add(:event_date, "can't be in the past") if
      	!event_date.blank? and event_date < Date.today
  	 end
end
