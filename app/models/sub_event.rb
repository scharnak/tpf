class SubEvent < ActiveRecord::Base
	belongs_to :event

	has_many :user_sub_events
	has_many :users, through: :user_sub_events
end
