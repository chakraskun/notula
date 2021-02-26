class MinutelistsController < ApplicationController
  before_action :set_minutelist, only: %i[ show edit update destroy ]

  # GET /minutelists or /minutelists.json
  def index
    @minutelists = Minutelist.all
  end

  # GET /minutelists/1 or /minutelists/1.json
  def show
  end

  # GET /minutelists/new
  def new
    @minutelist = Minutelist.new
  end

  # GET /minutelists/1/edit
  def edit
  end

  # POST /minutelists or /minutelists.json
  def create
    @minutelist = Minutelist.new(minutelist_params)

    respond_to do |format|
      if @minutelist.save
        format.html { redirect_to @minutelist, notice: "Minutelist was successfully created." }
        format.json { render :show, status: :created, location: @minutelist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minutelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minutelists/1 or /minutelists/1.json
  def update
    respond_to do |format|
      if @minutelist.update(minutelist_params)
        format.html { redirect_to @minutelist, notice: "Minutelist was successfully updated." }
        format.json { render :show, status: :ok, location: @minutelist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minutelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutelists/1 or /minutelists/1.json
  def destroy
    @minutelist.destroy
    respond_to do |format|
      format.html { redirect_to minutelists_url, notice: "Minutelist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minutelist
      @minutelist = Minutelist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minutelist_params
      params.require(:minutelist).permit(:minute, :member)
    end
end
