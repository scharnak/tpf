class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %i[admin staff community]

  has_many :volunteer_notes
  has_many :user_sub_events
  has_many :sub_events, through: :user_sub_events
end
