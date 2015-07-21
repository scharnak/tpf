class VolunteerNote < ActiveRecord::Base
	belongs_to :user
  belongs_to :created_by_user, class_name: 'User'
end
