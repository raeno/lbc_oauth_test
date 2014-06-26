class SessionsController < ApplicationController
  def create
    
    auth = request.env['omniauth.auth']
    
    if auth['info']['email']
      email = auth['info']['email']
    else
      token = auth['info']['token']
      email = "#{token}@mail.ru"
    end

    user = User.find_by_email(email) || User.create_with_omniauth(auth)

    sign_in user
    session[:user_id] = user.id
    session[:access_token] = auth['credentials']['token']
    session[:token] = auth['info']['token']
    session[:login] = auth['info']['login']
    session[:email] = email

    redirect_to tasks_path
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url
  end
end