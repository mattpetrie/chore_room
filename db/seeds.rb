# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Chore.create(title: "Do the dishes", user_id: 1, due_date: Time.now)
Chore.create(title: "Put the dishes away", user_id: 1, due_date: Time.now)