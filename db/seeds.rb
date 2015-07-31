# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventType.delete_all
Event.delete_all
Restaurant.delete_all
Preference.delete_all
PreferenceType.delete_all

event_type_1 = EventType.create(name: 'Brookside Park')
event_type_2  = EventType.create(name: 'Lunch')

event_1 = Event.create(name: "Event 1", event_type_id: event_type_1.id, date: Date.today)
event_2 = Event.create(name: "Event 2", event_type_id: event_type_2.id, date: Date.today)

restaurant_array = ["Downtown Patachou", "Broad Ripple Napolese", "Broad Ripple Patachou", "Keystone Napolese", "Public Greenss"]

restaurant_array.each {|r| Restaurant.create(name: r)}

preference_type_array = ["Weekly Availability", "Preferred Frequency", "Volunteer Interest", "Groups"]

preference_type_array.each {
	|pt| PreferenceType.create(name: pt)
}

preference_weekly_array = ["Monday","Tuesday","Wednesday","Thursday","Friday"]

preference_weekly_array.each {|a| Preference.create(preference_type_id: 17, name: a)}

preference_frequency_array = ["Weekly", "Twice a Month", "Monthly", "Twice a Semester"]

preference_frequency_array.each {|a| Preference.create(preference_type_id: 18, name: a)}

preference_interest_array = ["Food Service", "Education/Planned Small Groups", "Food Preperation", "Administrative Assistance", "Grant Writing", "Research"]

preference_interest_array.each {|a| Preference.create(preference_type_id: 19, name: a)}

preference_group_array = ["Yes, Mondays", "Yes Tuesdays", "No"]

preference_group_array.each {|a| Preference.create(preference_type_id: 20, name: a)}