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
Comment.delete_all

admin_user = User.create!(email: "admin@idea.com", password: "password", role: "admin", username: "admin", bio: "I am a benevolent dictator. Also I like backgammon.", remote_user_image_url: "http://placekitten.com/g/400/500")

normal_user1 = User.create!(email: "user@idea.com", password: "password", role: "user", username: "user1susername", bio: "I like the internet and all good things, but most especially kittens.", remote_user_image_url: "http://placekitten.com/g/300/300")

normal_user2 = User.create!(email: "user2@idea.com", password: "password", role: "user", username: "user2susername", bio: "I like baking cake when I have the ingredients to do so. Also Nascar.", remote_user_image_url: "http://placekitten.com/g/350/350")

number_of_idea_submitters = 20
number_of_lurkers = 200
number_of_users_created_above_this_point = 3
starting_point_for_lurkers = number_of_users_created_above_this_point + number_of_idea_submitters + 1
ending_point_for_lurkers = starting_point_for_lurkers + number_of_lurkers


(number_of_users_created_above_this_point..(number_of_idea_submitters + number_of_users_created_above_this_point)).each do |n|
    a = User.new
    a.email =  "user" + n.to_s + "@idea.com"
    a.password = "password"
    a.role = "user"
    a.bio = "I like to " + Faker::Company.bs + ". " + "Because in this age of distruption, it's not just about " + Faker::Company.catch_phrase.downcase + ". I learned all about it at business school."
    a.username = Faker::Internet.user_name + (9..99).to_a.sample.to_s
    a.user_image = "http://placekitten.com/g/300/300"
    # a.remote_user_image_url = "http://placekitten.com/g/300/300"
    a.save!
end

(starting_point_for_lurkers..ending_point_for_lurkers).each do |n|
    a = User.new
    a.email =  "user" + n.to_s + "@idea.com"
    a.password = "password"
    a.role = "user"
    a.bio = "Lurker..."
    a.username = Faker::Internet.user_name + (9..99).to_a.sample.to_s
    a.remote_user_image_url = "http://lorempixel.com/200/200/animals/" + (1..10).to_a.sample.to_s + "/"
    a.save!
end

Category.create!(name: "System", is_live: true)
app_category = Category.create!(name: "App", is_live: true)
enterprise_category = Category.create!(name: "Enterprise software", is_live: true)
Category.create!(name: "Magic potion", is_live: true)
Category.create!(name: "Lifestyle", is_live: true)
Category.create!(name: "Blue-sky thinking", is_live: true)

Idea.create!(title: "An app that calculates how many stops you have to travel for a given journey on the MTA", description: "People can't count. Even when there are only three lines serving the entirety of the greatest city mankind has ever seen. It's probably because they're too busy enjoying all that freedom. This app will let them now how many stops their journey involves - EVEN IF they are travelling through Union Square. #fuckyeah, bitches!", feedback_type: "Be honest (2)", remote_idea_image_url: "http://i.imgur.com/QmPkV6z.jpg", video_link: "https://www.youtube.com/embed/eAFnby2184o", user_id: normal_user1.id, category_id: app_category.id)

Idea.create!(title: "A To Do list, but ONLINE", description: "It's really hard to remember what you were meant to do. Like, when you go to the store and you forget to buy eggs. And you get home, chill for a bit. But then later, you're like, 'hey, I'm going to bake a cake'. So you go to the kitchen and start getting out all the ingredients. But then you realise you forgot to get eggs at the store! And also, hey, have you seen the dog? Where's the dog? Have you seen my dog? Oh man, did I leave the dog in the car? And where are my kids? Did they come to the store with me? I bet they'd like a cake.", feedback_type: "Please be nice (4)", remote_idea_image_url: "http://i.imgur.com/L3SeAW2.jpg", video_link: "https://www.youtube.com/watch?v=KdxEAt91D7k", user_id: normal_user2.id, category_id: enterprise_category.id)

you_tube_videos = ["https://www.youtube.com/watch?v=OtREUajBwIQ", "https://www.youtube.com/watch?v=1DTZ-fXU4iE", "https://www.youtube.com/watch?v=4UIj1mgePMg", "https://www.youtube.com/watch?v=Dr9IL7wR9hs", "https://www.youtube.com/watch?v=HwiBB4CNbVg", "https://www.youtube.com/watch?v=6tH5JmcIKX4", "https://www.youtube.com/watch?v=tAvmiOQoBP4", "https://www.youtube.com/watch?v=z3VI4VZOlhs", "https://www.youtube.com/watch?v=uRf05tqnGzc"]

# +1 so that the administrator isn't the one submitting an idea
first_user_id = User.first.id + 1
last_user_id_for_idea_submitters = User.last.id - number_of_lurkers

first_category_id = Category.first.id
last_category_id = Category.last.id
feedback_possibilities = ["Devil's advocate (1)", "Be honest (2)", "Meh, I dunno (3)", "Please be nice (4)", "Lie to me (5)"]

15.times do |n|
    a = Idea.new
    a.title = Faker::Company.catch_phrase + " 2.0"
    a.description = "This app will " + Faker::Company.bs + " in a way that's never been done before. Initially it will only be availabile on iOS. This is because I have an iPhone. Only one of my investors has an Android phone and my dad said he doesn't much care if he can use the app anyway."
    a.feedback_type = feedback_possibilities.to_a.sample.to_s
    a.remote_idea_image_url = "http://lorempixel.com/300/300/technics/" + (1..10).to_a.sample.to_s + "/"
    a.video_link = you_tube_videos.sample
    a.user_id = (first_user_id..last_user_id_for_idea_submitters).to_a.sample
    a.category_id = (first_category_id..last_category_id).to_a.sample
    a.save!
end

15.times do |n|
    a = Idea.new
    a.title = Faker::Company.catch_phrase
    a.description = "Ever tried to " + Faker::Company.bs + "? Yeah, I know, it's a pain in the ass, right? This product of mine is going to make it all better. Brilliant, isn't it? Don't worry, you can thank me later. Oh yeah, and vote my idea up. kthxbai"
    a.feedback_type = feedback_possibilities.to_a.sample.to_s
    a.remote_idea_image_url = "http://lorempixel.com/300/300/technics/" + (1..10).to_a.sample.to_s + "/"
    a.video_link = you_tube_videos.sample
    a.user_id = (first_user_id..last_user_id_for_idea_submitters).to_a.sample
    a.category_id = (first_category_id..last_category_id).to_a.sample
    a.save!
end

users = User.all
ideas = Idea.all

1100.times do |n|
  oneuser = users.sample
  oneidea = ideas.sample
  oneidea.liked_by oneuser, :vote_scope => 'vote_for_idea'
end

1250.times do |n|
  oneuser = users.sample
  oneidea = ideas.sample
  oneidea.disliked_by oneuser, :vote_scope => 'vote_for_idea'
end

150.times do |n|
  oneuser = users.sample
  oneidea = ideas.sample
  oneidea.liked_by oneuser, :vote_scope => 'rate_originality', :vote_weight => (1..5).to_a.sample
end


possible_comments = ["My kid sister has better ideas than you.", "Obama is Muslim.", "Seriously...?", "Yawn.", "Oh yeah, that exists. It's called Twitter. Heard of it?", "Ya'll be haters.", "What utter drivel.", "Just a spot of friendly advice: keep your day job.", "I find this offensive.", "This totally makes sense, within the bounds of a patriarchal society that promotes the continued oppression of women.", "It's called SPELL CHECK, you dufus.", "Honestly, I don't know what you kids do these days.", "Is that it? I built one of those last week. In my sleep.", "Made that in a hackathon.", "That is exactly like the homework I had to do for my class. I'm in 9th grade btw.", "Can haz cheezburger?", "Bowties are cool.", "Is that you, Toni?", "Cool, cool, cool.", "So basically, it's a blog.", "Cute.", "Awwww, it's like you don't even know that was built in the 80s.", "My grandmother implemented that while recovering from her knee surgery.", "Good day, I am one of the Financial Investor Partner with Forbes, Your contact was sent to me from Forbes for possible investment partnership, I have an Investment Proposal for you. If you are interested, reply me as soon as possible. Regards Dr. Kahalifa Jamal", "whatevs", "Hipchat me.", "Way to start a flame war.", "n00b", "OP gone stole someone else's idea...", "Laughing at you not with you.", "This is so profoundly stupid that it probably qualifies at modern art. Quick, some call the Tate Modern! This guy's got the goods!", "Dear Friend - Hi, I am Ms R Morathi of NEDBANK SA PTY, how are you doing? I have a one million business transaction to discuss with you. Kindly respond to this email as soon as possible. Thank you. Ms R Morathi", "In response to the new Facebook guidelines, I hereby declare that my copyright is attached to all of my personal details, illustrations, comics, paintings, professional photos and videos, etc (as a result of the Berner Convention).", "tl;dr", "If you could just stop posting ideas for products that have already been made 10 times, that'd be great."]

100.times do |n|
  body = possible_comments.sample
  oneuser = users.sample
  oneidea = ideas.sample
  a = Comment.build_from(oneidea, oneuser.id, body)
  a.save!
end
