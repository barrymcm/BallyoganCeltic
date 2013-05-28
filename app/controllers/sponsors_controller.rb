class SponsorsController < ApplicationController

  layout "admin_layout"

  # admin params filter check to see if the session[:position] is set and if so
  # set the @admin_tag which then makes the _admin_navbar partial visible
  before_filter :admin_params
  before_filter :check_if_public_user, :except => [:new, :create]
  before_filter :manager_permission, except: [:new, :create]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsors }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.json
  def new
    @sponsor = Sponsor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(params[:sponsor])

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to controller: :public_site, action: :home,
               :notice => 'Thank you! Your application has been submitted, One of our staff will be in contact soon'}
        format.json { render json: @sponsor, status: :created, location: @sponsor }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.json
  def update
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to sponsors_url }
      format.json { head :no_content }
    end
  end
end
