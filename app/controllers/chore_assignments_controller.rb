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

  def send_chores
    new_assignments = Chore.assign_chores!(User.all.map(&:id))
    new_assignments.each do |assignment|
      Notifier.chore_notification_email(assignment).deliver
    end
    redirect_to root_url
  end
end
