class LikesController < ApplicationController
 before_action :authenticate_user!
  def toggle
  
  #@like=Like.find_by(post_id:params[:post_id],user_id:current_user.id)

@post=Post.find(params[:post_id])


if @post.user_can_like(current_user.id)

@like=Like.create(post_id:params[:post_id],user_id:current_user.id)

else
	Like.find_by(post_id:params[:post_id],user_id:current_user.id).destroy
end
  end
end
