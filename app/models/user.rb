class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %i[community staff intern admin]

  has_many :volunteer_notes
  has_many :user_sub_events
  has_many :sub_events, through: :user_sub_events
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_many :user_preferences
  has_many :preferences, through: :user_preferences
end
