require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "Anacin", copy: "Fast, fast, incredibly fast relief", price: 10) }
 
 
   describe "attributes" do
     it "has title and body attributes" do
       expect(advertisement).to have_attributes(title: "Anacin", copy: "Fast, fast, incredibly fast relief", price: 10)
     end
   end
end
