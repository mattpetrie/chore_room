class CreateChoreAssignments < ActiveRecord::Migration
  def change
    create_table :chore_assignments do |t|
      t.references :user, index: true, null: false
      t.references :chore, index: true, null: false
      t.datetime :due_date, null: false

      t.timestamps
    end
    add_index :chore_assignments, [:user_id, :chore_id], unique: true
  end
end
