class AddDefaultValuetoCompleted < ActiveRecord::Migration
  def change
    change_column :chores, :completed, :boolean, default: true
  end
end
