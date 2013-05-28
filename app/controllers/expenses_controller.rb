class ExpensesController < ApplicationController

  layout "admin_layout"

  before_filter :admin_user
  before_filter :find_admin
  before_filter :admin_params
  before_filter :check_if_public_user
  before_filter :confirm_admin_user_login

  # GET /expenses
  # GET /expenses.json
  def index
    if @admin && @admin.position.to_s == "Treasurer"
      @expenses = Expense.all
    else
      @expenses = Expense.where(:admin_user_id => @admin.id)
    end
    respond_to do |format|
      format.html # not_index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])

  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html{ redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to action: :index, :id => @admin_user.id }
      format.json { head :no_content }
    end
  end

  def find_admin
    @admin_users = AdminUser.all

    if params[:id]
      @admin = AdminUser.find_by_id(params[:id])
    end
  end

end
