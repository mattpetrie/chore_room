class ChoresController < ApplicationController
  before_action :ensure_current_user

  def index
    @chore_assignments = ChoreAssignment.where(
              due_date: Chronic.parse('last Saturday')..Chronic.parse('next Monday')
              ).sort_by { |assignment| assignment.due_date }
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

  def send_chores
    new_assignments = Chore.assign_chores!(User.all.map(&:id))
    new_assignments.each do |assignment|
      Notifier.chore_notification_email(assignment).deliver
    end
    redirect_to root_url
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :day)
  end
end
