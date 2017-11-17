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
 post = Post.find_or_create_by!(title: "Third Post", body: "This is the third post in our system", topic: topics.first, user: users.first)
 
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
 
     user: users.sample,
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
 
 
# Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 ) 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"