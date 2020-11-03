class EventsController < ApplicationController
  before_action :signed_in?, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @event = Event.all
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Your event has been created."
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Your event has been updated."
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event has been cancelled."
    redirect_to root_path
  end


  private

  def signed_in?
    unless current_user
      flash[:info] = "You are not signed in."
      redirect_to login_path
    end
  end


  def event_params
    params.require(:event).permit(:description, :date, :title, :location)
  end
end
