class AccessController < ApplicationController

  layout "admin_layout"
  # Filters & notes are set in the application controller (Super Class)
  before_filter :contacts
  before_filter :admin_user
  before_filter :admin_menu
  before_filter :admin_params
  before_filter :confirm_admin_user_login, :confirm_public_user_login,
                :except => [:public_user_login, :admin_user_login,
                            :logout, :check_user_login_details,
                            :check_admin_user_login_details]

  def index
    # I could try to use an if statement to check the login status and
    # choose a view to render

    # render :user_menu
    render "public_user_login"
  end

  def home
    # code here
    render
  end

  def notices
    @admin_user = AdminUser.find_by_id(session[:user_id])
    @admin_expenses = Expense.where(:admin_user_id => @admin_user.id)

  end

  def user_menu
    if session[:public_user]
      @public_user = PublicUser.find_by_id(session[:user_id])
    end
  end

  def check_user_login_details
    # if the username and password match and a record
    # is found in the db then redirect to the
    # admin menu else redirect to the login page
    user_authorised = PublicUser.check_login_details(params[:username], params[:user_password])
    if user_authorised
      session[:user_id] = user_authorised.id
      session[:username] = user_authorised.username
      session[:public_user] = user_authorised.public_user

      t = Time.now
      if t.hour > 12
        flash[:notice] = "Good afternoon #{user_authorised.first_name} you're logged in."
      elsif t.hour < 12
        flash[:notice] = "Good morning #{user_authorised.first_name} you're logged in."

      end
      redirect_to action: :user_menu, :id => session[:user_id], :public_user => session[:public_user]
    else
      flash[:notice] = 'Please enter the correct username and password'
      redirect_to controller: :access, action: :public_user_login
    end
  end

  def check_admin_user_login_details
    # if the username and password match and a record
    # is found in the db then redirect to the
    # admin menu else redirect to the login page
    admin_authorised = AdminUser.check_login_details(params[:username], params[:password])
    if admin_authorised

      session[:user_id] = admin_authorised.id
      session[:username] = admin_authorised.username
      session[:position] = admin_authorised.position
      t = Time.now
      if t.hour > 12
        flash[:notice] = "Good afternoon #{admin_authorised.first_name} you're logged in."
      elsif t.hour < 12
        flash[:notice] = "Good morning #{admin_authorised.first_name} you're logged in."
      end
      redirect_to action: :admin_menu, :id => session[:user_id], :position => session[:position]
    else
      flash[:notice] = 'Please enter the correct username and password'
      redirect_to action: :admin_user_login
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'You are now logged out'
    redirect_to controller: :public_site, action: :home
  end

  # admin_menu defines the users status by their position and
  # sets their user privileges
  def admin_menu
    if session[:user_id] and session[:position]
      @admin_user = AdminUser.find_by_id(session[:user_id])

      @admin_expenses = Expense.where(:admin_user_id => @admin_user.id)

      # the following conditional sets the permissions
      if @admin_user.position.to_s == "ManagerSnr"
        flash[:notice] == "#{@admin_user.first_name} is logged in "
        @manager_permission = AdminUser.find_by_id(session[:user_id])

      elsif @admin_user.position.to_s == "Manager17"
        flash[:notice] == "#{@admin_user.first_name} is logged in "
        @manager_permission = AdminUser.find_by_id(session[:user_id])

      elsif @admin_user.position.to_s == "Manager15"
        flash[:notice] == "#{@admin_user.first_name} is logged in "
        @manager_permission = AdminUser.find_by_id(session[:user_id])

      elsif @admin_user.position.to_s == "Manager12"
        flash[:notice] == "#{@admin_user.first_name} is logged in "
        @manager_permission = AdminUser.find_by_id(session[:user_id])

      elsif @admin_user.position.to_s == "Secretary" or "Treasurer" or "Chairman"
        flash[:notice] == "#{@admin_user.first_name} is logged in"
        @admin_permission = AdminUser.find_by_id(session[:user_id])

      # superuser has full access
      elsif @admin_user.position.to_s == "Administrator"
        flash[:notice] == "#{@admin_user.first_name} is logged in"
        @super_user = AdminUser.find_by_id(session[:user_id])
      end
    end
  end

end
