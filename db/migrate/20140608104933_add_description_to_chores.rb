class AddDescriptionToChores < ActiveRecord::Migration
  def change
    add_column :chores, :description, :text
  end
end
