class Movecompletedboolean < ActiveRecord::Migration
  def change
  remove_column :chores, :completed
  add_column :chore_assignments, :completed, :boolean, default: false
  end
end
