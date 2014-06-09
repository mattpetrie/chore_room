task :check_chores do
  overdues = ChoreAssignment.where(due_date: Chronic.parse('Yesterday')..Chronic.parse('Today'))
      .select { |asgn| asgn.overdue? }
  # TODO run method that emails users with overdue chores
      
  if Time.now.sunday?
    ChoreAssignment.send_chores!
  end
end

