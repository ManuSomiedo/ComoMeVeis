class HabilitiesController < ApplicationController
  before_action :set_hability, only: [:show, :edit, :update, :destroy]

  # GET /habilities
  # GET /habilities.json
  def index
    @habilities = Hability.all
  end

  # GET /habilities/1
  # GET /habilities/1.json
  def show
  end

  # GET /habilities/new
  def new
    @hability = Hability.new
  end

  # GET /habilities/1/edit
  def edit
  end

  # POST /habilities
  # POST /habilities.json
  def create
    @hability = Hability.new(hability_params)

    respond_to do |format|
      if @hability.save
        format.html { redirect_to @hability, notice: 'Hability was successfully created.' }
        format.json { render :show, status: :created, location: @hability }
      else
        format.html { render :new }
        format.json { render json: @hability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habilities/1
  # PATCH/PUT /habilities/1.json
  def update
    respond_to do |format|
      if @hability.update(hability_params)
        format.html { redirect_to @hability, notice: 'Hability was successfully updated.' }
        format.json { render :show, status: :ok, location: @hability }
      else
        format.html { render :edit }
        format.json { render json: @hability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habilities/1
  # DELETE /habilities/1.json
  def destroy
    @hability.destroy
    respond_to do |format|
      format.html { redirect_to habilities_url, notice: 'Hability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hability
      @hability = Hability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hability_params
      params.require(:hability).permit(:name)
    end
end
