class HelpCallAnswersController < ApplicationController
  before_action :set_help_call_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_device, only: [:index, :new, :create]

  # GET /help_call_answers
  # GET /help_call_answers.json
  def index
    if @device
      @help_call_answers = @device.help_call_answers
    else
      @help_call_answers = HelpCallAnswer.all
    end
  end

  # GET /help_call_answers/1
  # GET /help_call_answers/1.json
  def show
    if params[:help_call_id]
      @back_path = help_call_path(@help_call_answer.help_call)
    elsif params[:device_id]
      @back_path = device_path(@help_call_answer.device)
    else
      @back_path = groups_path # help_call_answers_path
    end
  end

  # GET /help_call_answers/new
  def new
    @help_call_answer = @device.help_call_answers.new
  end

  # GET /help_call_answers/1/edit
  def edit
  end

  # POST /help_call_answers
  # POST /help_call_answers.json
  def create
    @help_call_answer = @device.help_call_answers.new(help_call_answer_params)

    respond_to do |format|
      if @help_call_answer.save
        format.html { redirect_to @help_call_answer, notice: 'Help call answer was successfully created.' }
        format.json { render :show, status: :created, location: @help_call_answer }
      else
        format.html { render :new }
        format.json { render json: @help_call_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_call_answers/1
  # PATCH/PUT /help_call_answers/1.json
  def update
    respond_to do |format|
      if @help_call_answer.update(help_call_answer_params)
        format.html { redirect_to @help_call_answer, notice: 'Help call answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @help_call_answer }
      else
        format.html { render :edit }
        format.json { render json: @help_call_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_call_answers/1
  # DELETE /help_call_answers/1.json
  def destroy
    device = @help_call_answer.device
    @help_call_answer.destroy
    respond_to do |format|
      format.html { redirect_to device_url(device), notice: 'Help call answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_call_answer
      @help_call_answer = HelpCallAnswer.find(params[:id])
    end

    def set_device
      if params[:device_id]
        @device = Device.find(params[:device_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_call_answer_params
      params.require(:help_call_answer).permit(:device_id, :help_call_id, :when, :lng, :lat)
    end
end
