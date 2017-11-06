require 'random_data'

 # Create Posts
 post = Post.find_or_create_by!(title: "Third Post", body: "This is the third post in our system")
 
 50.times do
 
   Post.create!(
 
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
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"