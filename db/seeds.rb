# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventType.delete_all
Event.delete_all

event_type_1 = EventType.create(name: 'Brookside Park')
event_type_2  = EventType.create(name: 'Lunch')

event_1 = Event.create(name: "Event 1", event_type_id: event_type_1.id, date: Date.today)
event_2 = Event.create(name: "Event 2", event_type_id: event_type_2.id, date: Date.today)