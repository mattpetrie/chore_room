class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]);
    # fail
  end
  
  def index
    @users = User.all
  end
  
end
