class SessionsController < ApplicationController
  def create
    
    auth = request.env["omniauth.auth"]
    
    user = User.find_by_email(auth['info']['email']) || User.create_with_omniauth(auth)

    sign_in user
    session[:user_id] = user.id
    session[:access_token] = auth["credentials"]["token"]
    redirect_to tasks_path
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url
  end
end