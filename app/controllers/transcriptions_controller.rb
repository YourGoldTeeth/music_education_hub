class TranscriptionsController < ApplicationController
  before_action :set_transcription, only: [:show, :edit, :update, :destroy]

  # GET /transcriptions
  # GET /transcriptions.json
  def index
    @transcriptions = Transcription.all
    @breadcrumb = "Transcriptions Index"

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

  # GET /transcriptions/1
  # GET /transcriptions/1.json
  def show
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

  # GET /transcriptions/new
  def new
    @transcription = Transcription.new

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

  # GET /transcriptions/1/edit
  def edit
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

  # POST /transcriptions
  # POST /transcriptions.json
  def create
    @transcription = Transcription.new(transcription_params)

    respond_to do |format|
      if @transcription.save

        format.html { redirect_to @transcription, notice: 'Transcription was successfully created.' }
        format.json { render :show, status: :created, location: @transcription }
      else
        format.html { render :new }
        format.json { render json: @transcription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcriptions/1
  # PATCH/PUT /transcriptions/1.json
  def update
    respond_to do |format|
      if @transcription.update(transcription_params)
        format.html { redirect_to @transcription, notice: 'Transcription was successfully updated.' }
        format.json { render :show, status: :ok, location: @transcription }
      else
        format.html { render :edit }
        format.json { render json: @transcription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcriptions/1
  # DELETE /transcriptions/1.json
  def destroy
    @transcription.destroy
    respond_to do |format|
      format.html { redirect_to transcriptions_url, notice: 'Transcription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.require(:transcription).permit(:name, :composer, :genre, :video_game, :attachment)
    end
end
