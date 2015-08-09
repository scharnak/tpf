class Event < ActiveRecord::Base
  extend SimpleCalendar

	belongs_to :event_type
	has_many :sub_events, dependent: :destroy

  has_calendar :attribute => :date

  validates :date, presence: true

  private

  before_save :set_day

  def set_day
  	self.day = self.date.strftime("%A")
  end

end
