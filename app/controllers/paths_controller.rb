class PathsController < ApplicationController
  before_action :set_path, only: [:show, :edit, :update, :destroy]
  before_action :set_device, only: [:index, :new, :create]

  # GET /devices/:id/paths
  # GET /devices/:id/paths.json
  def index
    if @device
      @paths = @device.paths
    else
      @paths = Path.all
    end
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
    if params[:device_id]
      @back_path = device_path(@path.device)
    else
      @back_path = groups_path # paths_path
    end
  end

  # GET /paths/new
  def new
    @path = @device.paths.new
  end

  # GET /paths/1/edit
  def edit
  end

  # POST /paths
  # POST /paths.json
  def create
    @path = @device.paths.new(path_params)

    respond_to do |format|
      if @path.save
        format.html { redirect_to @path, notice: 'Path was successfully created.' }
        format.json { render :show, status: :created, location: @path }
      else
        format.html { render :new }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paths/1
  # PATCH/PUT /paths/1.json
  def update
    respond_to do |format|
      if @path.update(path_params)
        format.html { redirect_to @path, notice: 'Path was successfully updated.' }
        format.json { render :show, status: :ok, location: @path }
      else
        format.html { render :edit }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paths/1
  # DELETE /paths/1.json
  def destroy
    device = @path.device
    @path.destroy
    respond_to do |format|
      format.html { redirect_to device_url(device), notice: 'Path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_path
      @path = Path.find(params[:id])
    end

    def set_device
      if params[:device_id]
        @device = Device.find(params[:device_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def path_params
      if params[:device_id]
        params.permit(:device_id)
      else
        params.require(:path).permit(:device_id)
      end
    end
end
