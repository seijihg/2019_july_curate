# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do
      users = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      user_name: Faker::FunnyName.name.delete(' ').downcase,
      password: "aaaaaa"
    )
  end

5.times do
    exhibitions = Exhibition.create(
    title: Faker::Music.album,
    artist: Faker::Artist.name, 
    category: Faker::Music.genre,
    gallery: Faker::Company.name,
    location: Faker::Nation.capital_city,
    date_end: Faker::Date.forward(23),
    user_id: User.all.map {|user| user.id}.sample
    )
end

10.times do
  Comment.create(
    content: Faker::Quote.most_interesting_man_in_the_world, 
    exhibition_id: Exhibition.all.map {|exhibition| exhibition.id}.sample
    )
end
   
10.times do
  Like.create(user_id: User.all.map {|user| user.id}.sample, exhibition_id: Exhibition.all.map {|exhibition| exhibition.id}.sample)
end

10.times do
  CommentLike.create(user_id: User.all.map {|user| user.id}.sample, comment_id: Comment.all.map {|comment| comment.id}.sample)
end

puts "-----SEEDED-----"