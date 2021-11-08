class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_parameter)
    @event.user_id = current_user.id
    @event.save
    redirect_to events_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :body, :start_time)
  end


end
