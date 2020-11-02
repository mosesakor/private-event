class EventsController < ApplicationController
  before_action :signed_in?, only: [:show, :new, :index, :create]

  def index
    @event = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = current_user.created_events.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def signed_in?
    unless current_user
      redirect_to new_session_path, notice: 'you are not signed in!'
    end
  end

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
