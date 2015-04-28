class Event < ActiveRecord::Base
	belongs_to :host, class_name: 'User'
	has_many :guests, through: :invites
	has_many :invites


	validates :title, presence: true, length: { maximum: 40 }
	validates :description, presence: true, length: {minimum: 5}
	validates :location, presence: true, length: { minimum: 3}
	validates :eventDate, presence: true
	validates :startTime, presence: true

	scope :upcoming, -> eventDate{ where("eventDate >= ?", Date.today).order('eventDate ASC') }
	scope :past, -> eventDate { where("eventDate < ?", Date.today).order('eventDate DESC') }
end
