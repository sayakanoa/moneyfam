class PostCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def new
    @post_comment = PostComment.new
    @user = User.find(params[:user_id])
    # 今日の日付を取得する
    @month = Time.zone.today
    @event = Event.find_by(user_id: @user.id, created_at: @month.all_month)
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id

    @event = @post_comment.event
    if @post_comment.save
      @event.create_notification_comment!(current_user, @post_comment.id)
      redirect_to events_path(user_id: @post_comment.event.user_id), notice: "コメントできました"
    else
      @user = User.find_by(params[:event_id])
      @month = Time.zone.today
      @event = Event.find_by(user_id: @user.id, created_at: @month.all_month)
      flash[:alert] = "コメントできていません。"
      render :new
    end
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

  def correct_user
    post_comment = PostComment.find(params[:id])
    redirect_to events_path(user_id: post_comment.event.user_id) unless post_comment.user == current_user
  end
end
