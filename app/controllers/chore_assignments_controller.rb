class ChoreAssignmentsController < ApplicationController
  before_action :ensure_current_user
  def index
    @chore_assignments = ChoreAssignment.includes(:chore, :user).where(
          due_date: Chronic.parse('last Saturday')..Chronic.parse('next Sunday')
          ).sort_by { |assignment| assignment.due_date }
  end

  def complete
    @chore_assignment = ChoreAssignment.find(params[:id])
    if @chore_assignment.due_date < Date.tomorrow
      @chore_assignment.completed = true
      @chore_assignment.save
      redirect_to thank_you_url
    else
      redirect_to too_early_url
    end
  end

  def flag
    @chore_assignment = ChoreAssignment.find(params[:id])
    @chore_assignment.flagged = true
    @chore_assignment.save
    redirect_to root_url
  end

  def unflag
    @chore_assignment = ChoreAssignment.find(params[:id])
    @chore_assignment.flagged = false
    @chore_assignment.save
    redirect_to root_url
  end

  def send_chores
    ChoreAssignment.send_chores!
    redirect_to root_url
  end

  def send_overdue
    ChoreAssignment.send_overdue!
    redirect_to root_url
  end
end
