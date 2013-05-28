class PublicUsersController < ApplicationController

  layout "admin_layout"

  before_filter :confirm_public_user_login, :except => [:new, :create]
  before_filter :manager_permission, except: [:new, :create, :edit, :update]
  before_filter :admin_user
  before_filter :admin_params
  before_filter :contacts

  # GET /public_users
  # GET /public_users.json
  def index
    # If the public user tries to access the users list they are redirected
    # back to the home page
    if @public_user
      redirect_to controller: :public_site, action: :home
    else
      @public_users = PublicUser.all

      respond_to do |format|
        format.html # not_index.html.erb
        format.json { render json: @public_users }
      end
    end
  end

  # GET /public_users/1
  # GET /public_users/1.json
  def show
    @public_user = PublicUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @public_user }
    end
  end

  # GET /public_users/new
  # GET /public_users/new.json
  def new
    @public_user = PublicUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @public_user }
    end
  end

  # GET /public_users/1/edit
  def edit
    @public_user = PublicUser.find(params[:id])

  end

  # POST /public_users
  # POST /public_users.json
  def create

    @public_user = PublicUser.new(params[:public_user])

      if @public_user.save
        flash[:notice] = 'Your account was created, Please login'
        redirect_to controller: :access, action: :public_user_login
      else
        render action: "new"
      end
  end

  def register
    @public_user = PublicUser.new(params[:public_user])

    respond_to do |format|
      if @public_user.save
        format.html { redirect_to controller: :public_site, action: :home,
                       flash[:notice] => 'Your account was created, Please login to see your details'}
        format.json { render json: @public_user, status: :created, location: @public_user }
      else
        format.html { render action: "new" }
        format.json { render json: @public_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_show
    # gives the admin user access to view the public users account
    @public_user = PublicUser.find(params[:id])

    render :admin_show
  end

  # PUT /public_users/1
  # PUT /public_users/1.json
  def update
    @public_user = PublicUser.find(params[:id])

      if @public_user.update_attributes(params[:public_user])
        flash[:notice] = 'Your account was updated'
        redirect_to controller: :access, action: :user_menu, :id => session[:user_id],
                    :public_user => session[:public_user]
      else
        render action: "edit"
      end

  end

  # DELETE /public_users/1
  # DELETE /public_users/1.json
  def destroy
    @public_user = PublicUser.find(params[:id])
    @public_user.destroy

    respond_to do |format|
      format.html { redirect_to public_users_url }
      format.json { head :no_content }
    end
  end

end
