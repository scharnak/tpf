class Preference < ActiveRecord::Base
	has_many :user_preferences
	has_many :users, through: :user_preferences
	belongs_to :preference_type
end
