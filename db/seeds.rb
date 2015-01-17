# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Idea.delete_all
Category.delete_all


User.create!(email: "admin@idea.com", password: "password", role: "admin", username: "admin", bio: "I am a benevolent dictator. Also I like backgammon.")

User.create!(email: "user@idea.com", password: "password", role: "user", username: "user1", bio: "I like the internet and all good things, but most especially kittens.")

Category.create!(name: "System", is_live: true)
Category.create!(name: "App", is_live: true)
Category.create!(name: "Enterprise software", is_live: true)
Category.create!(name: "Magic potion", is_live: true)
Category.create!(name: "Lifestyle", is_live: true)
Category.create!(name: "Blue-sky thinking", is_live: true)

Idea.create!(title: "An app that calculates how many stops you have to travel for a given journey on the MTA", description: "People can't count. Even when there are only three lines serving the entirety of the greatest city mankind has ever seen. It's probably because they're too busy enjoying all that freedom. This app will let them now how many stops their journey involves - EVEN IF they are travelling through Union Square. #fuckyeah, bitches!", feedback_type: "Be honest (2)")










