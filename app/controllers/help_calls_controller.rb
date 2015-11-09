class HelpCallsController < ApplicationController
  before_action :set_help_call, only: [:show, :edit, :update, :destroy]

  # GET /help_calls
  # GET /help_calls.json
  def index
    @help_calls = HelpCall.all
  end

  # GET /help_calls/1
  # GET /help_calls/1.json
  def show
  end

  # GET /help_calls/new
  def new
    @help_call = HelpCall.new
  end

  # GET /help_calls/1/edit
  def edit
  end

  # POST /help_calls
  # POST /help_calls.json
  def create
    @help_call = HelpCall.new(help_call_params)

    respond_to do |format|
      if @help_call.save
        format.html { redirect_to @help_call, notice: 'Help call was successfully created.' }
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
    @help_call.destroy
    respond_to do |format|
      format.html { redirect_to help_calls_url, notice: 'Help call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_call
      @help_call = HelpCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_call_params
      params.require(:help_call).permit(:device_id, :when, :lng, :lat)
    end
end
