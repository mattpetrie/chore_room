# == Schema Information
#
# Table name: chores
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  due_date   :datetime         not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Chore < ActiveRecord::Base
  validates :title, :user, :due_date, presence: true

  belongs_to :user

  def self.assign_chores!(user_ids)
    user_list = user_ids.shuffle!
    user_list += user_list.shuffle! until user_list.length >= Chore.count
    self.update_all(completed: false)  
    self.all.each { |chore| chore.user_id = user_list.shift }
  end
end

