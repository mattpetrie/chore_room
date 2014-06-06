class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :email, null: false
      t.string :photo, null: false

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
