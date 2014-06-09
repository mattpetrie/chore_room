class AddFlagtoChores < ActiveRecord::Migration
  def change
    add_column :chore_assignments, :flagged, :boolean, default: false
  end
end
