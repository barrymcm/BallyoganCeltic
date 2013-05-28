class TrainingSessionsController < ApplicationController

  layout 'admin_layout'

  before_filter :find_team
  before_filter :admin_params
  before_filter :check_if_public_user
  before_filter :confirm_admin_user_login
  before_filter :admin_permission

  # GET /training_sessions
  # GET /training_sessions.json
  def index
    @training_sessions = TrainingSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @training_sessions }
    end
  end

  # GET /training_sessions/1
  # GET /training_sessions/1.json
  def show

    @training_session = TrainingSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training_session }
    end
  end

  # GET /training_sessions/new
  # GET /training_sessions/new.json
  def new
    @training_session = TrainingSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training_session }
    end
  end

  # GET /training_sessions/1/edit
  def edit
    @training_session = TrainingSession.find(params[:id])

  end

  # POST /training_sessions
  # POST /training_sessions.json
  def create
    @training_session = TrainingSession.new(params[:training_session])

    respond_to do |format|
      if @training_session.save
        format.html { redirect_to @training_session, notice: 'Training session was successfully created.' }
        format.json { render json: @training_session, status: :created, location: @training_session }
      else
        format.html { render action: "new" }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /training_sessions/1
  # PUT /training_sessions/1.json
  def update
    @training_session = TrainingSession.find(params[:id])

    respond_to do |format|
      if @training_session.update_attributes(params[:training_session])
        format.html { redirect_to @training_session, notice: 'Training session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_sessions/1
  # DELETE /training_sessions/1.json
  def destroy
    @training_session = TrainingSession.find(params[:id])
    @training_session.destroy

    respond_to do |format|
      format.html { redirect_to training_sessions_url }
      format.json { head :no_content }
    end
  end

end
