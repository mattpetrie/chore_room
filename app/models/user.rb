# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  uid        :string(255)      not null
#  email      :string(255)      not null
#  photo      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  admin      :boolean          default(FALSE), not null
#  eligible   :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  validates :name, :uid, :email, :photo, presence: true
  validates :uid, uniqueness: true

  has_many :chore_assignments, dependent: :destroy
  has_many :assigned_chores, through: :chore_assignments, source: :chore

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.photo = auth["info"]["image"]
      user.email = auth["info"]["email"]
    end
  end

  def completed_chores
    @completed_chores ||= self.chore_assignments.where(completed: true, flagged: false)
  end
end
