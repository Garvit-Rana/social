class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]
before_action :set_post, only: [:destroy]
  before_action :authorize, only: [:destroy]
  def home
  @post=Post.new
  @posts=Post.all
  @comment=Comment.new
  end

  def create
  post=Post.create(content:params[:post][:content], user_id:current_user.id)
redirect_to action: "home"
  end

  def destroy
 
@post.destroy



  end
private
def set_post
@post=Post.find(params[:id])
end
def authorize
if @post.user_id!=current_user.id
redirect_to action: "home"
end
end
end
