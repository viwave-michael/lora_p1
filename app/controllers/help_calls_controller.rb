class HelpCallsController < ApplicationController
  before_action :set_help_call, only: [:show, :edit, :update, :destroy]
  before_action :set_device, only: [:index, :new, :create]

  # GET /help_calls
  # GET /help_calls.json
  def index
    if @device
      @help_calls = @device.help_calls
    else
      @help_calls = HelpCall.all
    end
  end

  # GET /help_calls/1
  # GET /help_calls/1.json
  def show
    @back_path = device_path(@help_call.device)
  end

  # GET /help_calls/new
  def new
    @help_call = @device.help_calls.new
  end

  # GET /help_calls/1/edit
  def edit
  end

  # POST /help_calls
  # POST /help_calls.json
  def create
    @help_call = @device.help_calls.new(help_call_params)

    respond_to do |format|
      if @help_call.save
        format.html { redirect_to device_help_calls_path(@device), notice: 'Help call was successfully created.' }
        format.json { render :show, status: :created, location: @help_call }
      else
        format.html { render :new }
        format.json { render json: @help_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_calls/1
  # PATCH/PUT /help_calls/1.json
  def update
    respond_to do |format|
      if @help_call.update(help_call_params)
        format.html { redirect_to @help_call, notice: 'Help call was successfully updated.' }
        format.json { render :show, status: :ok, location: @help_call }
      else
        format.html { render :edit }
        format.json { render json: @help_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_calls/1
  # DELETE /help_calls/1.json
  def destroy
    device = @help_call.device
    @help_call.destroy
    respond_to do |format|
      format.html { redirect_to device_help_calls_path(device), notice: 'Help call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_call
      @help_call = HelpCall.find(params[:id])
    end

    def set_device
      if params[:device_id]
        @device = Device.find(params[:device_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_call_params
      help_call = params[:help_call]
      if help_call && !help_call.empty?
        params.require(:help_call).permit(:device_id, :when, :lng, :lat)
      else
        params.permit(:device_id, :when, :lng, :lat)
      end
    end
end
