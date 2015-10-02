class SubEvent < ActiveRecord::Base
	belongs_to :sub_event_type
	belongs_to :event
	has_many :user_sub_events
	has_many :users, through: :user_sub_events

  def volunteer_count(role)
    self.users.where(role: role).count
  end

  def is_full?(role)
    volunteer_count(role) >= self.send("#{role}_num".to_sym)
  end

end

