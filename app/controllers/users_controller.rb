class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    #@created_events = current_user.created_events
    #@attended_events = current_user.attended_events
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'User has been created'
      redirect_to @user

    else
      render 'new'
      flash.now[:danger] = 'User could not be created'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "This user has been deleted."
    redirect_to root_path
  end

  private

  def signed_in?
    unless current_user
      redirect_to new_session_path, success: 'you are not signed in!'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end