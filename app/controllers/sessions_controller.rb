class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    # nullifies session
    session[:user_id] = nil
    # redirecting to home page
    redirect_to :root
  end

  # omniauth for Github
  def create_oauth
    if env["omniauth.auth"].provider == "facebook" then
      nick = env["omniauth.auth"].info.name
    else
      nick = env["omniauth.auth"].info.nickname
    end
    if ((User.find_by username:nick).nil?) then
      pass = ((0...8).map { (65 + rand(26)).chr }.join) + 123.to_s
      user = User.create(username:nick, password:pass, password_confirmation:pass)
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Thanks for logging in with #{env["omniauth.auth"].provider}"
    else
      user = (User.find_by username:nick)
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    end
  end

end
