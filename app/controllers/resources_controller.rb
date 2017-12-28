class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    if can? :update, Resource
      @resources = Resource.all
    else  
      @resources = Resource.where(instrument_id: current_user.instrument_id) 
    end
    @breadcrumb = "Your Instrument's Resources"

    if current_user.role_id == 4
      if current_user.notification_id != 0 
        @notifications = Homework.all.order("created_at DESC")
        @alert_check = Homework.last.id
        @admin = true
      end  
    else
      if current_user.notification_id != 0   
        @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
        @alert_check = Assignment.where(user_id: current_user.id).last.id
        @admin = false
      end  
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @instruments = Instrument.all

    if current_user.role_id == 4
      if current_user.notification_id != 0 
        @notifications = Homework.all
        @alert_check = Homework.last.id
        @admin = true
      end
    else  
      if current_user.notification_id != 0 
        @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
        @alert_check = Assignment.where(user_id: current_user.id).last.id
        @admin = false
      end  
    end
  end

  # GET /resources/1/edit
  def edit
    @instruments = Instrument.all

    if current_user.role_id == 4
      if current_user.notification_id != 0 
        @notifications = Homework.all
        @alert_check = Homework.last.id
        @admin = true
      end  
    else  
      if current_user.notification_id != 0 
        @notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
        @alert_check = Assignment.where(user_id: current_user.id).last.id
        @admin = false
      end  
    end
  end

  # POST /resources
  # POST /resources.json
  def create
    @instruments = Instrument.all
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @instruments = Instrument.all
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :instrument_id, :attachment)
    end
end
