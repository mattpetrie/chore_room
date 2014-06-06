class AddDefaultValuetoCompletedFalse < ActiveRecord::Migration
  def change
    change_column :chores, :completed, :boolean, default: false
  end
end
