class AddCrewToChores < ActiveRecord::Migration
  def change
    add_column :chores, :crew, :integer, null: false
  end
end
