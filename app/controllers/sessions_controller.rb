class SessionsController < ApplicationController
  def new
  end
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Successfully Signed in!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to root_url
  end
  
end
