class RollCallAnswersController < ApplicationController
  before_action :set_roll_call_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_device, only: [:index, :new, :create]

  # GET /roll_call_answers
  # GET /roll_call_answers.json
  def index
    if @device
      @roll_call_answers = @device.roll_call_answers
    else
      @roll_call_answers = RollCallAnswer.all
    end
  end

  # GET /roll_call_answers/1
  # GET /roll_call_answers/1.json
  def show
    if params[:roll_call_id]
      @back_path = roll_call_path(@roll_call_answer.roll_call)
    elsif params[:device_id]
      @back_path = device_path(@roll_call_answer.device)
    else
      @back_path = groups_path # roll_call_answers_path
    end
  end

  # GET /roll_call_answers/new
  def new
    @roll_call_answer = @device.roll_call_answers.new
  end

  # GET /roll_call_answers/1/edit
  def edit
  end

  # POST /roll_call_answers
  # POST /roll_call_answers.json
  def create
    @roll_call_answer = @device.roll_call_answers.new(roll_call_answer_params)

    respond_to do |format|
      if @roll_call_answer.save
        format.html { redirect_to @roll_call_answer, notice: 'Roll call answer was successfully created.' }
        format.json { render :show, status: :created, location: @roll_call_answer }
      else
        format.html { render :new }
        format.json { render json: @roll_call_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roll_call_answers/1
  # PATCH/PUT /roll_call_answers/1.json
  def update
    respond_to do |format|
      if @roll_call_answer.update(roll_call_answer_params)
        format.html { redirect_to @roll_call_answer, notice: 'Roll call answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @roll_call_answer }
      else
        format.html { render :edit }
        format.json { render json: @roll_call_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roll_call_answers/1
  # DELETE /roll_call_answers/1.json
  def destroy
    device = @roll_call_answer.device
    @roll_call_answer.destroy
    respond_to do |format|
      format.html { redirect_to device_url(device), notice: 'Roll call answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll_call_answer
      @roll_call_answer = RollCallAnswer.find(params[:id])
    end

    def set_device
      if params[:device_id]
        @device = Device.find(params[:device_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_call_answer_params
      if params[:roll_call_id]
        params.permit(:roll_call_id, :device_id, :when, :lng, :lat)
      else
        params.require(:roll_call_answer).permit(:roll_call_id, :device_id, :when, :lng, :lat)
      end
    end
end
