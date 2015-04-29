class Event < ActiveRecord::Base
	belongs_to :host, class_name: 'User'
	has_many :guests, through: :invites
	has_many :invites, :foreign_key => 'attended_event_id'


	validates :title, presence: true, length: { maximum: 40 }
	validates :description, presence: true, length: {minimum: 5}
	validates :location, presence: true, length: { minimum: 3}
	validates :event_date, presence: true
	validates :start_time, presence: true

	scope :upcoming, -> event_date { where("event_date >= ?", Date.today).order("event_date ASC") }
	scope :past, -> event_date { where("event_date < ?", Date.today).order("event_date DESC") }
end
