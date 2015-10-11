# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventType.delete_all
Event.delete_all
Preference.delete_all
PreferenceType.delete_all
Restaurant.delete_all
SubEvent.delete_all
SubEventType.delete_all
User.delete_all

### CREATE EVENT TYPES
event_type1 = EventType.create(name: 'Brookside Park', street: Faker::Address.street_address, state: "IN", city: "Indianapolis", zip_code: "46202")
event_type2= EventType.create(name: 'Lunch',street: Faker::Address.street_address, state: "IN", city: "Indianapolis", zip_code: "46202")
event_type3 = EventType.create(name: 'Another EventType', street: Faker::Address.street_address, state: "IN", city: "Indianapolis", zip_code: "46202")
event_types = [event_type1, event_type2,event_type3]


### CREATE EVENTS
(1..5).each do
  e_type = event_types.sample
  Event.create!(name: "#{Faker::Company.name}", date: Faker::Date.forward(15), event_type: e_type)
end

### CREATE SUBEVENT TYPES
SubEventType.create(name: "Education Group", description: Faker::Lorem.paragraph)
SubEventType.create(name: "Lunch Group", description: Faker::Lorem.paragraph)
SubEventType.create(name: "Another Group", description: Faker::Lorem.paragraph)

### CREATE SUBEVENTS
Event.all.each do |event|
  rand(1..3).times do
    type = SubEventType.all.pluck(:id)
    start_time = Faker::Time.between(event.date.beginning_of_day, event.date.end_of_day, :afternoon)
    event.sub_events << SubEvent.create(name: Faker::Company.name, start_time: start_time, end_time: (start_time + 3.hours) , intern_num:rand(0..4), staff_num: rand(0..4), community_num: rand(0..4), sub_event_type_id: type[rand(0..2)])
  end
end


#### CREATE RESTAURANTS
restaurant_array = ["Downtown Patachou", "Broad Ripple Napolese", "Broad Ripple Patachou", "Keystone Napolese", "Public Greenss"]
restaurant_array.each {|r| Restaurant.create(name: r)}

#### CREATE PREFERENCE STUFF
preference_type_array = ["Weekly Availability", "Preferred Frequency", "Volunteer Interest", "Groups"]

total_data = [["Monday","Tuesday","Wednesday","Thursday","Friday"], ["Weekly", "Twice a Month", "Monthly", "Twice a Semester"],
 ["Food Service", "Education/Planned Small Groups", "Food Preperation", "Administrative Assistance", "Grant Writing", "Research"],
  ["Yes, Mondays", "Yes Tuesdays", "No"]]

preference_type_array.each_with_index do |pt, index|
  pt = PreferenceType.create(name: pt)
  total_data[index].each do |m|
    pt.preferences << Preference.create(name: m)
  end
end

### CREATE USERS

User::ROLES.each do |u|
  user = User.create!(fname:"#{u}", lname: "#{u}", email: "#{u}@#{u}.com", phonenumber: "317-222-2222", password: "#{u}1234", password_confirmation: "#{u}1234")
  user.update!(role: u, approved: true)
end

