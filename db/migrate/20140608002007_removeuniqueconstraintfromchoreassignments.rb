class Removeuniqueconstraintfromchoreassignments < ActiveRecord::Migration
  def change
    remove_index :chore_assignments, [:user_id, :chore_id]
    add_index :chore_assignments, [:user_id, :chore_id]
  end
end
