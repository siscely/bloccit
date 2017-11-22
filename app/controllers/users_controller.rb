class UsersController < ApplicationController
    def new
     @user = User.new
   end
   


   def confirm
 
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]

  end
   

   def create
 
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
 
 
     if @user.save
       create_session(@user)
       flash[:notice] = "Welcome to Bloccit #{@user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end
   
    def show
     @user = User.find(params[:id])
     @posts = @user.posts.visible_to(current_user)
   end
   
   def detect_post_or_comment
    post = current_user.Post.find(params[:id])
    comment = current_user.Comment.find(params[:id])
     unless current_user == comment.user || post.user?
     flash[:alert] = "{user.name} has not submitted any posts yet."
     redirect_to [post.topic, post]
    end
 end
end