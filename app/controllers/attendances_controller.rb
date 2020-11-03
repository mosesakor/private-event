class AttendancesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :create
  before_action :correct_user_or_event_creator, only: :destroy

  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event.attendees.delete(@user)
    redirect_to @event
  end
end
