class Notifier < ActionMailer::Base
  include SendGrid
  default from: "chores@choreroom.com"

  # sendgrid_category :use_subject_lines
  # sendgrid_enable   :ganalytics, :opentrack
  # sendgrid_unique_args :key1 => "value1", :key2 => "value2"


  def chore_notification_email(assignment)
    @user = assignment.user
    @chore = assignment.chore
    @due_date = assignment.due_date.to_formatted_s(:long_ordinal)
    @url = "http://localhost:3000/chore_assignments/complete/#{assignment.id}"
    sendgrid_category "Chore Notification"
    # sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail :to => @user.email, :subject => "#{@user.name}. You've got a chore!"
  end

  def overdue_email(assignment)
    @user = assignment.user
    @chore = assignment.chore
    @due_date = assignment.due_date.to_formatted_s(:long_ordinal)
    @url = "http://localhost:3000/chore_assignments/complete/#{assignment.id}"
    sendgrid_category "Overdue Chore"
    # sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail :to => @user.email, :subject => "#{@user.name}. Your chore is overdue!"
  end
end
