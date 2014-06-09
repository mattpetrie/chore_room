# == Schema Information
#
# Table name: chore_assignments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  chore_id   :integer          not null
#  due_date   :date             not null
#  created_at :datetime
#  updated_at :datetime
#  completed  :boolean          default(FALSE)
#

class ChoreAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  def overdue?
    self.due_date < Date.today && !self.completed
  end
end
