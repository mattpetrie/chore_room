class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.datetime :due_date, null: false
      t.boolean :completed, null: false
      
      t.timestamps
    end
    add_index :chores, :user_id
  end
end
