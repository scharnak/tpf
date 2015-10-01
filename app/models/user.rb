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
  has_many :user_notifications
  has_many :notifications, through: :user_notifications

  before_create :set_defaults

  validates_format_of :phonenumber,
      :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
      :message => "- Phone numbers must be in xxx-xxx-xxxx format."

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def full_name
   "#{fname} #{lname}"
  end

  private

  def set_defaults
    self.approved = 0
    self.role = ''
    self.hours = 0
  end
end
