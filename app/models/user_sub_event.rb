class UserSubEvent < ActiveRecord::Base
	belongs_to :user
	belongs_to :sub_event
end
