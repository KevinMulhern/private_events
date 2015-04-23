class Invite < ActiveRecord::Base
	belongs_to :event
	belongs_to :guest, :class_name => "User"

	validates :guest_id, presence: true
	validates :event_id, presence: true
end
