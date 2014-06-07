class RemoveNullChecksOnChores < ActiveRecord::Migration
  def change
    change_column :chores, :user_id, :integer, null: true
    change_column :chores, :due_date, :datetime, null: true
  end
end
