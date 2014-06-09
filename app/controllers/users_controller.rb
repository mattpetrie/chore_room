class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]);
    # fail
  end
  
  def index
    @users = User.all
  end

  def leaderboard
    @users = User.all.sort_by { |user| -user.completed_chores.count }
  end
  
end
