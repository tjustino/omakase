class EncadrantsController < ApplicationController
  before_action :set_encadrant, only: [:show, :edit, :update, :destroy]

  # GET /encadrants
  # GET /encadrants.json
  def index
    @encadrants = Encadrant.all.order_by_name
  end

  # GET /encadrants/1
  # GET /encadrants/1.json
  def show
  end

  # GET /encadrants/new
  def new
    @encadrant = Encadrant.new
  end

  # GET /encadrants/1/edit
  def edit
  end

  # POST /encadrants
  # POST /encadrants.json
  def create
    @encadrant = Encadrant.new(encadrant_params)

    respond_to do |format|
      if @encadrant.save
        format.html { redirect_to @encadrant, notice: 'Encadrant was successfully created.' }
        format.json { render :show, status: :created, location: @encadrant }
      else
        format.html { render :new }
        format.json { render json: @encadrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encadrants/1
  # PATCH/PUT /encadrants/1.json
  def update
    respond_to do |format|
      if @encadrant.update(encadrant_params)
        format.html { redirect_to @encadrant, notice: 'Encadrant was successfully updated.' }
        format.json { render :show, status: :ok, location: @encadrant }
      else
        format.html { render :edit }
        format.json { render json: @encadrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encadrants/1
  # DELETE /encadrants/1.json
  def destroy
    @encadrant.destroy
    respond_to do |format|
      format.html { redirect_to encadrants_url, notice: 'Encadrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encadrant
      @encadrant = Encadrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encadrant_params
      params.require(:encadrant).permit(:nom)
    end
end
