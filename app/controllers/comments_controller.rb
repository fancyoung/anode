class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    params[:comment][:creater_id] = current_user.id
    params[:comment][:updater_id] = current_user.id

    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
end
