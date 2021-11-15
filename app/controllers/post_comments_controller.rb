class PostCommentsController < ApplicationController

  def new
    @post_comment = PostComment.new
    @user = User.find(params[:user_id])
    #今日の日付を取得する
    @month = Time.zone.today
    @event = Event.find_by(user_id: @user.id, created_at: @month.all_month)
  end

  def create
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to events_path(user_id: comment.event.user_id)
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to events_path(user_id: post_comment.event.user_id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:event_id, :comment)
  end


end
