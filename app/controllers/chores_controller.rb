class ChoresController < ApplicationController

    before_action :ensure_current_user

  def index
    @chores = Chore.all
    @users = User.all
  end

  def send_chores
    Chore.all.each do | chore |
      Notifier.chore_notification_email(chore).deliver
    end
    redirect_to root_url
  end

end
