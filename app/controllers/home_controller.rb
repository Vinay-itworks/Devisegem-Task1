class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :about, :users ]
  before_action :check_admin!, only: [ :users ]

  def index
  end

  def about
    @user = current_user
  end

  def users
    @users = User.all
  end

  def change_lock
    message = ""
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
      message = "unlocked"
    else
      @user.lock_access!
      message = "locked"
    end
    redirect_to users_path, { alert: "User with email #{@user.email} has been #{message}." }
  end
end
