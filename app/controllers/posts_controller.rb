class PostsController < ApplicationController
  def index
    @posts = Post.all
    @hi = "hi, Siscely!"
  end

  def show
  end

  def new
  end

  def edit
  end
end
