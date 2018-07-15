class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authorize, only: [:destroy]
  def create
    @new_comment=Comment.create(content:params[:comment][:content], user_id:current_user.id, post_id:params[:comment][:post_id])
  
  end

  def destroy
  	@k=@comment.id
    @comment.destroy
  	  end
  private
  def set_comment
  @comment=Comment.find(params[:id])
  end
  def authorize
  if @comment.user_id!=current_user.id
  redirect_to root_path
  end
  end
end
