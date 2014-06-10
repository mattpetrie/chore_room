task :send_chores do
  ChoreAssignment.send_overdue!

  if Time.now.sunday?
    ChoreAssignment.send_chores!
  end
end

