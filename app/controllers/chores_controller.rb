class ChoresController < ApplicationController
  before_action :ensure_current_user

  def index
    @chores = Chore.all
  end

  def new
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      flash[:notice] = "#{@chore.title} added!"
      redirect_to chores_url
    else
      flash[:errors] = @chore.errors.full_messages
      redirect_to chores_url
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
    params.require(:chore).permit(:title, :day, :crew)
  end
end
