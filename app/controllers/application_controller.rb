class ApplicationController < ActionController::Base

  protect_from_forgery

  protected # for use by this class and its subclasses

  def confirm_public_user_login

    if session[:user_id].blank? and session[:public_user].blank?
      flash[:notice] = "Please log in"
      redirect_to(controller: :access, action: :public_user_login)
      return false
    else
      return true
    end
  end

  def confirm_admin_user_login

    if session[:user_id].blank?
      flash[:notice] = 'Please log in'
      redirect_to(controller: :access, action: :admin_user_login)
      return false
    else
      return true
    end
  end

  # These controls work however they block access to all admin users
  # because the instance variables are not being passed back from the access
  # controller.  (Problem Solved - filter methods below are working)

  # Used to restrict managers access to admin areas - expenses etc
  def manager_permission
    if session[:position].to_s == "Manager"
      flash[:notice] = "RESTRICTED: you do not have access"
      redirect_to controller: :access, action: :admin_menu, :id => session[:user_id],
                  :position => session[:position]
      return false
    end
  end

  # Used to restrict admin users to access to manager areas - players / leagues etc
  def admin_permission
    if session[:position].to_s == "Secretary" or
        session[:position].to_s == "Treasurer" or
        session[:position].to_s == "Chairman"
      flash[:notice] = "RESTRICTED: you do not have access"
      redirect_to controller: :access, action: :admin_menu, :id => session[:user_id],
                  position: session[:position]
      return false
    end

  end

  # Used to restrict public user access to admin areas
  def check_if_public_user
    if session[:public_user]
        session[:public_user] = nil
        session[:user_id] = nil
      flash[:notice] = "RESTRICTED: You do not have access"
      redirect_to controller: :access, action: :user_menu
      false
    end
  end

  # This checks the user position and
  # makes the admin_navbar visible if the user is is logged in
  def admin_params
    if session[:user_id] and session[:position]
      @admin_tag = session[:position]
    end
  end

  # Used to maintain admin status inside the admin area
  def admin_user
    if session[:user_id] and session[:position]
      @admin_user = AdminUser.find_by_id(session[:user_id])
    end
  end

  def league_title
    @league = League.find_by_id(params[:league_id])
  end

  # I want to use this to dry up the code in the form views
  # that displays the drop down lists for league selection in, players, fixtures, clubs
  def league_list
    @league_list = League.all.collect {|l| [l.title, l.id]}
  end

  def find_league
    @leagues = League.all
  end

  def find_team
    @team = Team.all
  end

  def contacts
    @contacts = AdminUser.all
  end

  #redirect_to controller: :access, action: :user_menu, :id => session[:user_id],
  #:public_user => session[:public_user] unless params[session[:position]]
  # can be used to place a message that follows the user around the admin area
  # @username = "You are logged in as #{session[:username]}"

end