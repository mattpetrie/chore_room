task send_chores: :environment do
  ChoreAssignment.send_overdue!

  if Time.now.sunday?
    ChoreAssignment.send_chores!
  end
end

