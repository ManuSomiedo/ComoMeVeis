class ValorationsController < ApplicationController
  before_action :get_user
  before_action :set_valoration, only: [:show, :edit, :update, :destroy]
  # GET /valorations
  # GET /valorations.json
  def index
    @valorations = @user.valorations
  end

  # GET /valorations/1
  # GET /valorations/1.json
  def show
    @valoration = @user.valorations.find(params[:id])
    puts 'aaadsfsdasdasdasdasdasdasdas'
    puts @valoration.sender_id
  end

  # GET /valorations/new
  def new
    @valoration = Valoration.new

  end

  # GET /valorations/1/edit
  def edit
  end

  # POST /valorations
  # POST /valorations.json
  def create
    @valoration = @user.valorations.new(valoration_params)
    @valoration.sender_id = current_user.id

    respond_to do |format|
      if @valoration.save
        format.html { redirect_to [@user,@valoration] }
        format.json { render :show, status: :created, location: [@user,@valoration] }
      else
        format.html { render :new }
        format.json { render json: [@user,@valoration.errors], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valorations/1
  # PATCH/PUT /valorations/1.json
  def update
    @valoration = @user.valorations.new(valoration_params)
    @valoration.sender_id = current_user.id
    respond_to do |format|
      if @valoration.update(valoration_params)
        format.html { redirect_to [@user,@valoration], notice: 'Valoration was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user,@valoration] }
      else
        format.html { render :edit }
        format.json { render json: @valoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valorations/1
  # DELETE /valorations/1.json
  def destroy
    @valoration.destroy
    respond_to do |format|
      format.html { redirect_to user_valorations_path, notice: 'Valoration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def get_user
      @user = User.find(params[:user_id])
    end
    def set_valoration
      @valoration = Valoration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valoration_params
      params.require(:valoration).permit(:user_id, :hability_id, :points, :created_at)
    end
end
