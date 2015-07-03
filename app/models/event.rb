class Event < ActiveRecord::Base
	belongs_to :event_type
	has_many :sub_events, dependent: :destroy
end
