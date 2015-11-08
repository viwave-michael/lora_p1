class RollCallsController < ApplicationController
  before_action :set_roll_call, only: [:show, :edit, :update, :destroy]

  # GET /roll_calls
  # GET /roll_calls.json
  def index
    @roll_calls = RollCall.all
  end

  # GET /roll_calls/1
  # GET /roll_calls/1.json
  def show
  end

  # GET /roll_calls/new
  def new
    @roll_call = RollCall.new
  end

  # GET /roll_calls/1/edit
  def edit
  end

  # POST /roll_calls
  # POST /roll_calls.json
  def create
    @roll_call = RollCall.new(roll_call_params)

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
    @roll_call.destroy
    respond_to do |format|
      format.html { redirect_to roll_calls_url, notice: 'Roll call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll_call
      @roll_call = RollCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_call_params
      params.require(:roll_call).permit(:device_id, :when, :lng, :lat, :manual)
    end
end
