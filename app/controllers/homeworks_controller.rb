class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /homeworks
  # GET /homeworks.json
  def index
    # @homeworks = Homework.all
    if can? :update, Homework
      @homeworks = Homework.all
      @last_updated = Homework.last
    else  
      @homeworks = Homework.where(user_id: current_user.id)
      @last_updated = Homework.where(user_id: current_user.id).last
    end
    @resources = Resource.all
    @breadcrumb = "Your Homework Table"

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

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    @back = "Your Homework Table"
    @breadcrumb = "View Homework"

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

  # GET /homeworks/new
  def new
    @user = current_user
    # @assignments = Assignment.where(user_id: current_user.id) 
    @homework = Homework.new
    @assignment_id = params[:assignment_id].to_i 
    @resources = Resource.all
    @back = "Your Assignments Table"
    @breadcrumb = "Upload New Homework"

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


  # GET /homeworks/1/edit
  def edit
    @user = current_user
    @assignment_id = params[:assignment_id].to_i
    @back = "Your Assignments Table"
    @breadcrumb = "Edit Uploaded Homework"

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

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = Homework.new(homework_params) 
    @homework.user_id = current_user.id
    @assignment_id = params[:assignment_id].to_i

    respond_to do |format|
      if @homework.save
        homework_id = @homework.id
        select_assignment_id = @homework.assignment_id
        @homework.add_homework_id_to_assignment(select_assignment_id, homework_id)
        
        # format.html { redirect_to @assignments, notice: 'Homework was successfully created.' }
        format.html { redirect_to homework_path(@homework), notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    @homework.user_id = current_user.id
    @assignment_id = params[:assignment_id].to_i

    respond_to do |format|
      if @homework.update(homework_params)
        homework_id = @homework.id
        select_assignment_id = @homework.assignment_id
        @homework.add_homework_id_to_assignment(select_assignment_id, homework_id)

        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:name, :user_id, :attachment, :assignment_id)
    end
end

 # def couple
  #   @homework = Homework.new(homework_params[:assignment_id])
  # end 
