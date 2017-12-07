class AdminUsersController < ApplicationController

  # layout 'admin' (this line added by Kevin S, but don't recall when/why)

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    @adminuser_count = AdminUser.count

    if @admin_user.save
      flash[:notice] = "Admin user created successfully."
      redirect_to(admin_users_path)
    else
      #if save fails, re-display the form so user can fix problem
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
    @adminuser_count = AdminUser.count
  end

  def update
    # Find a new object using form parameters:
    @admin_user = AdminUser.find(params[:id])
    # Update the object:
    if @admin_user.update_attributes(admin_user_params)
      # If save succeeds, redirect to the show action:
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "Admin user destroyed successfully."
    redirect_to(admin_users_path)
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
