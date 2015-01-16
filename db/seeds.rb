# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Idea.delete_all


User.create!(email: "admin@idea.com", password: "password", role: "admin", username: "admin", bio: "I am a benevolent dictator. Also I like backgammon.")

User.create!(email: "user@idea.com", password: "password", role: "user", username: "user1", bio: "I like the internet and all good things, but most especially kittens.")


