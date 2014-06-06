class ChoresController < ApplicationController

    before_action :ensure_current_user
  
  def index
    @chores = Chore.all
    @users = User.all
  end
  
end
