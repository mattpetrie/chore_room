class ChoresController < ApplicationController

    before_action :ensure_current_user
  
  def index
    @chores = Chore.all
    @users = User.all
  end

  def new
  end
  
  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      render json: @chore
    else
      render json: @chore.errors.full_messages, status: 422
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def chore_params
    params.require(:chore).permit(:title, :user_id, :due_date)
  end
end
