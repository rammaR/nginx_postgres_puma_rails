class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password]) && user.auth_token
      if params[:remember_me]
         cookies.permanent[:auth_token] = user.auth_token
      else
         cookies[:auth_token] = user.auth_token
      end

      # Old method using session
      # session[:user_id] = user.id

      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    # Old method using session
    # session[:user_id] = nil

    cookies.delete :auth_token

    redirect_to root_url, notice: 'Logged out!'
  end
end
