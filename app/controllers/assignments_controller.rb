class AssignmentsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :alert_check

  # GET /assignments
  # GET /assignments.json
  def alert_check
    if current_user.role_id == 4
      @alert_check = Homework.last.id
      @notif_id = current_user.notification_id
        if @alert_check > @notif_id
           @alert = true
           # if @clicked  
           #    current_user.update_attribute(:notification_id, @alert_check)
           #    @clicked = false
           # end   
        else   
           @alert = false
        end
    else  
      @alert_check = Assignment.where(user_id: current_user.id).last.id
      @notif_id = current_user.notification_id
      if @alert_check > @notif_id
           @alert = true
           # if @clicked  
              # current_user.update_attribute(:notification_id, @alert_check)
              # @clicked = false
           # end 
        else   
           @alert = false
        end
    end
  end 

  def index
    if can? :update, Assignment
      @assignments = Assignment.all
      @last_updated = Assignment.last
    else  
      @assignments = Assignment.where(user_id: current_user.id)
      @last_updated = Assignment.where(user_id: current_user.id).last
    end
    @resources = Resource.all
    @breadcrumb = "Your Assignments Table" 

    if current_user.role_id == 4
      @notifications = Homework.all.order("created_at DESC")
      @alert_check = Homework.last.id
      @admin = true
    else  
      @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
      @alert_check = Assignment.where(user_id: current_user.id).last.id
      @admin = false
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])
    @resources = Resource.all
    authorize! :read, @assignment
    @back = "Your Assignments Table"
    @breadcrumb = "View Assignment" 

    if current_user.role_id == 4
      @notifications = Homework.all
      @alert_check = Homework.last.id
      @admin = true
    else  
      @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
      @alert_check = Assignment.where(user_id: current_user.id).last.id
      @admin = false
    end 
  end

  # GET /assignments/new
  def new
    @users = User.all
    @assignment = Assignment.new
    @resources = Resource.all
    @back = "Your Assignments Table"
    @breadcrumb = "New Assignment" 
    # @assignment.homework.build

    if current_user.role_id == 4
      @notifications = Homework.all
      @alert_check = Homework.last.id
      @admin = true
    else  
      @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
      @alert_check = Assignment.where(user_id: current_user.id).last.id
      @admin = false
    end
  end

  # GET /assignments/1/edit
  def edit
    @users = User.all
    @back = "Your Assignments Table"
    @breadcrumb = "Edit Assignment"

    if current_user.role_id == 4
      @notifications = Homework.all
      @alert_check = Homework.last.id
      @admin = true
    else  
      @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
      @alert_check = Assignment.where(user_id: current_user.id).last.id
      @admin = false
    end
  end



  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @users = User.all
    @resources = Resource.all

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :user_id, :homework_id, :attachment)
    end
end
