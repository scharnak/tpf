class Event < ActiveRecord::Base
  extend SimpleCalendar

	belongs_to :event_type
	has_many :sub_events, dependent: :destroy

  has_calendar :attribute => :date
end
