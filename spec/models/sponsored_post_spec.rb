require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
    
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph } 
   let(:topic) { Topic.create!(name: name, description: description) }
   let(:sponsoredpost) { SponsoredPost.create!(title: title, body: body, topic: topic) }
 
   describe "attributes" do
     it "has a body attribute" do
       expect(sponsoredpost).to have_attributes(title: title, body: body)
     end
   end
end
