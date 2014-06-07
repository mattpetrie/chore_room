class RemoveColumnsFromChores < ActiveRecord::Migration
  def change
    remove_column :chores, :due_date
    remove_column :chores, :user_id
  end
end
