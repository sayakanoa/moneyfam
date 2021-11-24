class EventsController < ApplicationController

  before_action :correct_user, only: [:destroy]

  def new
    @event = Event.new
  end

  def index
    @user = User.find(params[:user_id])
    @events = @user.events
    @post_comments = @user.post_comments
    # 今日の日付を取得する
    @month = Time.zone.today
    @event_month = Event.where(user_id: @user.id, created_at: @month.all_month)
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path(user_id: @event.user_id), notice: "追加できました"
    else
      flash[:alert] = "追加できていません。"
      render :new
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path(user_id: event.user_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time)
  end

  def correct_user
    event = Event.find(params[:id])
    redirect_to events_path(current_user) unless event.user == current_user
  end

end
