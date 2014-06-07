# == Schema Information
#
# Table name: chores
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Chore < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user

  # Refactor to work with ChoreAssignments
  # def self.assign_chores!(user_ids)
  #   user_list = user_ids.shuffle!
  #   user_list += user_list.shuffle! until user_list.length >= Chore.count
  #   self.update_all(completed: false)
  #   self.all.each { |chore| chore.user_id = user_list.shift }
  # end
end