class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to stories_url
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if authenticated? user
      session[:user_id] = user.id
      redirect_to stories_url, :notice => "Logged in successfully"
    else
      flash.now.alert = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url, :notice => "Logged out successfully"
  end

  private

  def authenticated?(user)
    user && user.authenticate(params[:password])
  end
end
