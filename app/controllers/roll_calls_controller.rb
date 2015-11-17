class RollCallsController < ApplicationController
  before_action :set_roll_call, only: [:show, :edit, :update, :destroy]
  before_action :set_device, only: [:index, :new, :create]

  # GET /roll_calls
  # GET /roll_calls.json
  def index
    if @device
      @roll_calls = @device.roll_calls
    else
      @roll_calls = RollCall.all
    end
  end

  # GET /roll_calls/1
  # GET /roll_calls/1.json
  def show
    if params[:device_id]
      @back_path = device_path(@roll_call.device)
    else
      @back_path = groups_path # roll_calls_path
    end
  end

  # GET /roll_calls/new
  def new
    @roll_call = @device.roll_calls.new
  end

  # GET /roll_calls/1/edit
  def edit
  end

  # POST /roll_calls
  # POST /roll_calls.json
  def create
    @roll_call = @device.roll_calls.new(roll_call_params)

    respond_to do |format|
      if @roll_call.save
        format.html { redirect_to @roll_call, notice: 'Roll call was successfully created.' }
        format.json { render :show, status: :created, location: @roll_call }
      else
        format.html { render :new }
        format.json { render json: @roll_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roll_calls/1
  # PATCH/PUT /roll_calls/1.json
  def update
    respond_to do |format|
      if @roll_call.update(roll_call_params)
        format.html { redirect_to @roll_call, notice: 'Roll call was successfully updated.' }
        format.json { render :show, status: :ok, location: @roll_call }
      else
        format.html { render :edit }
        format.json { render json: @roll_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roll_calls/1
  # DELETE /roll_calls/1.json
  def destroy
    device = @roll_call.device
    @roll_call.destroy
    respond_to do |format|
      format.html { redirect_to device_url(device), notice: 'Roll call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll_call
      @roll_call = RollCall.find(params[:id])
    end

    def set_device
      if params[:device_id]
        @device = Device.find(params[:device_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_call_params
      if params[:device_id]
        params.permit(:device_id, :when, :lng, :lat, :manual)
      else
        params.require(:roll_call).permit(:device_id, :when, :lng, :lat, :manual)
      end
    end
end
