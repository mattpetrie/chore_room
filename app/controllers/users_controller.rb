class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @residents = User.where(current_resident: true)
    if current_user.admin
      @all_users = User.all.sort_by { |user| user.created_at }
    end
  end

  def leaderboard
    @users = User.current_residents.sort_by { |user| -user.completed_chores.count }
  end

  def add_resident
    @user = User.find(params[:id])
    @user.current_resident = true
    @user.save
    redirect_to users_url
  end

  def remove_resident
    @user = User.find(params[:id])
    @user.current_resident = false
    @user.save
    redirect_to users_url
  end
end
