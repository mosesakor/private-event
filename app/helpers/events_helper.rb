module EventsHelper
  def correct_user_or_event_creator
    unless correct_user || event_creator
      flash[:warning] = "You are not authorized for this action."
      redirect_to root_path
    end
  end

  def event_creator
    creator = Event.find(params[:event_id]).creator
    current_user == creator
  end

  def correct_user
    user = User.find(params[:user_id])
    current_user == user
  end
end
