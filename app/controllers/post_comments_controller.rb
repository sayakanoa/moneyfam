class PostCommentsController < ApplicationController

  def create
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to events_path
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to events_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
