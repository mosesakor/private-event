class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user_path(user.id)
      flash.now[:success] = 'You are signed in!'
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Logged out."
    redirect_to root_path
  end

end