class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]);
    # fail
  end
  
  
  
end
