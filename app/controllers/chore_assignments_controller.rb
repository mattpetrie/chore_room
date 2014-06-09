class ChoreAssignmentsController < ApplicationController
  before_action :ensure_current_user
  def index
    @chore_assignments = ChoreAssignment.where(
          due_date: Chronic.parse('last Saturday')..Chronic.parse('next Sunday')
          ).sort_by { |assignment| assignment.due_date }
  end

  def complete
    @chore_assignment = ChoreAssignment.find(params[:id])
    @chore_assignment.completed = true
    @chore_assignment.save
    redirect_to thank_you_url
  end

  def flag
    @chore_assignment = ChoreAssignment.find(params[:id])
    if @chore_assignment.flagged
      @chore_assignment.flagged = false
    else
      @chore_assignment.flagged = true
    end
    @chore_assignment.save
    redirect_to root_url
  end

  def send_chores
    ChoreAssignement.send_chores!
    redirect_to root_url
  end
end
