FactoryGirl.define do
   factory :comments do
     title RandomData.random_sentence
     body RandomData.random_paragraph
     topic
     post
     user
     rank 0.0
   end
 end