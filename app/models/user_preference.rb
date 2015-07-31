class UserPreference < ActiveRecord::Base
	belongs_to :user 
	belongs_to :preference
end
