class HelpCallAnswersController < ApplicationController
  before_action :set_help_call_answer, only: [:show, :edit, :update, :destroy]

  # GET /help_call_answers
  # GET /help_call_answers.json
  def index
    @help_call_answers = HelpCallAnswer.all
  end

  # GET /help_call_answers/1
  # GET /help_call_answers/1.json
  def show
  end

  # GET /help_call_answers/new
  def new
    @help_call_answer = HelpCallAnswer.new
  end

  # GET /help_call_answers/1/edit
  def edit
  end

  # POST /help_call_answers
  # POST /help_call_answers.json
  def create
    @help_call_answer = HelpCallAnswer.new(help_call_answer_params)

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
    @help_call_answer.destroy
    respond_to do |format|
      format.html { redirect_to help_call_answers_url, notice: 'Help call answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_call_answer
      @help_call_answer = HelpCallAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_call_answer_params
      params.require(:help_call_answer).permit(:device_id, :help_call_id, :when, :lng, :lat)
    end
end
