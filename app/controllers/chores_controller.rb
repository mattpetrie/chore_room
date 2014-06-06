class ChoresController < ApplicationController
  
  def index
    @chores = Chore.all
    @users = User.all
  end
  
end
