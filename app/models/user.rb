class User < ActiveRecord::Base
	has_many :events, :foreign_key => "host_id"
	has_many :invites, :foreign_key => "guest_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
