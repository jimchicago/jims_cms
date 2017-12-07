class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display text and links
  end

  def login
    # display login form
  end

  def attempt_login  # Kicks in when form is submitted
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id  # "Mark" user as authorized
      flash[:notice] = "Voila, you are now logged in."
      redirect_to(admin_path)
    else
      flash[:notice] = "Invalid combination of username and password."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You are now logged out. Bye!"
    redirect_to(access_login_path)
  end

end
