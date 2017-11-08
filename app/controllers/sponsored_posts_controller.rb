class SponsoredPostsController < ApplicationController
    def show
    @sponsoredpost = SponsoredPost.find(params[:id])
    end
    
    def new
     @topic = Topic.find(params[:topic_id])
     @sponsoredpost = SponsoredPost.new
    end
   
    def edit
     @sponsoredpost = SponsoredPost.find(params[:id])
    end
   
    def create
     @sponsoredpost = SponsoredPost.new
     @sponsoredpost.title = params[:sponsoredpost][:title]
     @sponsoredpost.body = params[:sponsoredpost][:body]
     @topic = Topic.find(params[:topic_id])
 
     @sponsoredpost.topic = @topic

     if @sponsoredpost.save
       flash[:notice] = "Post was saved."
 
       redirect_to @sponsoredpost
       redirect_to [@topic, @sponsoredpost]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end
end
