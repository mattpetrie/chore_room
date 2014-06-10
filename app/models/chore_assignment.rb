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
#  flagged    :boolean          default(FALSE)
#

class ChoreAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  def self.send_chores!
    new_assignments = Chore.assign_chores!(User.where(eligible: true).map(&:id))
    new_assignments.each do |assignment|
      Notifier.chore_notification_email(assignment).deliver
    end
  end

  def self.send_overdue!
    self.where(due_date: Date.yesterday).each do |assignment|
      Notifier.overdue_email(assignment).deliver if assignment.overdue?
    end
  end

  def overdue?
    self.due_date < Date.today && !self.completed
  end
end
