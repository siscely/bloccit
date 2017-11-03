require 'random_data'

 # Create Advertisements

 
 50.times do
 
   Advertisement.create!(
 
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph
   )
   
 end
 advertisements = Advertisement.all
 
 
 # Create Comments
 # post.comments.find_or_create_by!(body: "Third Comment!")
 
 # 100.times do
 #   Comment.create!(
 
 #     post: posts.sample,
 #     body: RandomData.random_paragraph
 #   )
 # end
 
 puts "Seed finished"
 puts "#{Advertisement.count} advertisements created"
 # puts "#{Comment.count} comments created"