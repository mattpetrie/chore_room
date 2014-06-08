class ChoresController < ApplicationController
  before_action :ensure_current_user

  def index
    @chore_assignments = ChoreAssignment.where(
              due_date: Chronic.parse('last Saturday')..Chronic.parse('next Sunday')
              ).sort_by { |assignment| assignment.due_date }
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

  def send_chores
    new_assignments = Chore.assign_chores!(User.all.map(&:id))
    new_assignments.each do |assignment|
      Notifier.chore_notification_email(assignment).deliver
    end
    redirect_to root_url
  end

  def complete
    @chore_assignment = ChoreAssignment.find(params[:id])
    @chore_assignment.completed = true
    @chore_assignment.save
    redirect_to thank_you_url
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :day, :crew)
  end
end
