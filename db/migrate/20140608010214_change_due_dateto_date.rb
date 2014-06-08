class ChangeDueDatetoDate < ActiveRecord::Migration
  def change
    change_column :chore_assignments, :due_date, :date
  end
end
