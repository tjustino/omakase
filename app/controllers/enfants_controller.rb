class EnfantsController < ApplicationController
  before_action :set_enfant, only: [:show, :edit, :update, :destroy]

  # GET /enfants
  # GET /enfants.json
  def index
    @enfants = Enfant.all.order_by_name
  end

  # GET /enfants/1
  # GET /enfants/1.json
  def show
  end

  # GET /enfants/new
  def new
    @enfant = Enfant.new
  end

  # GET /enfants/1/edit
  def edit
  end

  # POST /enfants
  # POST /enfants.json
  def create
    @enfant = Enfant.new(enfant_params)

    respond_to do |format|
      if @enfant.save
        format.html { redirect_to @enfant, notice: 'Enfant was successfully created.' }
        format.json { render :show, status: :created, location: @enfant }
      else
        format.html { render :new }
        format.json { render json: @enfant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enfants/1
  # PATCH/PUT /enfants/1.json
  def update
    respond_to do |format|
      if @enfant.update(enfant_params)
        format.html { redirect_to @enfant, notice: 'Enfant was successfully updated.' }
        format.json { render :show, status: :ok, location: @enfant }
      else
        format.html { render :edit }
        format.json { render json: @enfant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enfants/1
  # DELETE /enfants/1.json
  def destroy
    @enfant.destroy
    respond_to do |format|
      format.html { redirect_to enfants_url, notice: 'Enfant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enfant
      @enfant = Enfant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enfant_params
      params.require(:enfant).permit(:nom)
    end
end
