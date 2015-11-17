class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  before_action :set_path, only: [:index, :new, :create]

  # GET /positions
  # GET /positions.json
  def index
    if @path
      @positions = @path.positions
    else
      @positions = Position.all
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    if params[:path_id]
      @back_path = path_path(@position.path)
    else
      @back_path = groups_path # paths_path
    end
  end

  # GET /positions/new
  def new
    @position = @path.positions.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = @path.positions.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    path = @position.path
    @position.destroy
    respond_to do |format|
      format.html { redirect_to path_url(path), notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    def set_path
      if params[:path_id]
        @path = Path.find(params[:path_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      if params[:path_id]
        params.permit(:path_id, :when, :lng, :lat)
      else
        params.require(:position).permit(:path_id, :when, :lng, :lat)
      end
    end
end
