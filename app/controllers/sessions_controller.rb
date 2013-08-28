class SessionsController < ApplicationController
  def create
    # raise env['omniauth.auth'].to_yaml
    user = User.from_omniauth(env['omniauth.auth'])
    if user.save
      session[:user_id] = user.id
      redirect_to map_path, notice: "Signed in."
    else
      render 'map_path'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out."
  end

  def failure
    redirect_to root_path, alert: "Authentication failed, please try again."
  end
end
