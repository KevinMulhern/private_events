class User < ActiveRecord::Base
	has_many :events, :foreign_key => "host_id", dependent: :destroy
	has_many :invites, :foreign_key => "guest_id", dependent: :destroy
	has_many :attended_events, through: :invites, dependent: :destroy

	validates :name, presence: true, length: { minimum: 4 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
