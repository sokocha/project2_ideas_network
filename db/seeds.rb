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


admin_user = User.create!(email: "admin@idea.com", password: "password", role: "admin", username: "admin", bio: "I am a benevolent dictator. Also I like backgammon.")

normal_user1 = User.create!(email: "user@idea.com", password: "password", role: "user", username: "user1susername", bio: "I like the internet and all good things, but most especially kittens.")

normal_user2 = User.create!(email: "user2@idea.com", password: "password", role: "user", username: "user2susername", bio: "I like baking cake when I have the ingredients to do so. Also Nascar.")

Category.create!(name: "System", is_live: true)
app_category = Category.create!(name: "App", is_live: true)
enterprise_category = Category.create!(name: "Enterprise software", is_live: true)
Category.create!(name: "Magic potion", is_live: true)
Category.create!(name: "Lifestyle", is_live: true)
Category.create!(name: "Blue-sky thinking", is_live: true)

Idea.create!(title: "An app that calculates how many stops you have to travel for a given journey on the MTA", description: "People can't count. Even when there are only three lines serving the entirety of the greatest city mankind has ever seen. It's probably because they're too busy enjoying all that freedom. This app will let them now how many stops their journey involves - EVEN IF they are travelling through Union Square. #fuckyeah, bitches!", feedback_type: "Be honest (2)", main_image: "http://i.imgur.com/QmPkV6z.jpg", video_link: "HpBHWUPa8Q", user_id: normal_user1.id, category_id: app_category.id)

Idea.create!(title: "A To Do list, but ONLINE", description: "It's really hard to remember what you were meant to do. Like, when you go to the store and you forget to buy eggs. And you get home, chill for a bit. But then later, you're like, 'hey, I'm going to bake a cake'. So you go to the kitchen and start getting out all the ingredients. But then you realise you forgot to get eggs at the store! And also, hey, have you seen the dog? Where's the dog? Have you seen my dog? Oh man, did I leave the dog in the car? And where are my kids? Did they come to the store with me? I bet they'd like a cake.", feedback_type: "Please be nice (4)", main_image: "http://i.imgur.com/L3SeAW2.jpg", video_link: "HpBHWUPa8Q", user_id: normal_user2.id, category_id: enterprise_category.id)










