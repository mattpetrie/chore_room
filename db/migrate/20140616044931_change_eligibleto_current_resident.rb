class ChangeEligibletoCurrentResident < ActiveRecord::Migration
  def change
    rename_column :users, :eligible, :current_resident
    change_column :users, :current_resident, :boolean, default: false
  end
end
