class UserNotification < ActiveRecord::Base
	belongs_to :user
	belongs_to :notification

  scope :unread, ->(user_id=nil){where(user_id: user_id, read: false)}
end
