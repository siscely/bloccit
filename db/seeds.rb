require 'random_data'

# Create Users
 5.times do
   User.create!(
 
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all


# Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all
 
 # Create sponsoredposts
 15.times do
   SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 sponsoredpost = SponsoredPost.all

 # Create Posts
 post = Post.find_or_create_by!(title: "Third Post", body: "This is the third post in our system")
 
 50.times do
 
   Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
   
 end
 posts = Post.all
 
 
 # Create Comments
 post.comments.find_or_create_by!(body: "Third Comment!")
 
 100.times do
   Comment.create!(
 
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 10.times do 
  Question.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
 end
 
 user = User.first
 user.update_attributes!(
   email: 'siscely.george@gmail.com',
   password: 'helloworld'
 )
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"