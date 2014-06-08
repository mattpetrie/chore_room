class AddDayToChores < ActiveRecord::Migration
  def change
    add_column :chores, :day, :string
  end
end
