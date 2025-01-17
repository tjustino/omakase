# frozen_string_literal: true

# Encadrants Controller
class EncadrantsController < ApplicationController
  before_action :set_encadrant, only: %i[edit update destroy]

  # GET /encadrants
  def index
    @encadrants = Encadrant.all.order_by_name
  end

  # GET /encadrants/new
  def new
    @encadrant = Encadrant.new
  end

  # GET /encadrants/1/edit
  def edit; end

  # POST /encadrants
  def create
    @encadrant = Encadrant.new(encadrant_params)

    if @encadrant.save
      redirect_to encadrants_url, notice: "Le nouvel encadrant a bien été créé."
    else
      render :new
    end
  end

  # PATCH/PUT /encadrants/1
  def update
    if @encadrant.update(encadrant_params)
      redirect_to encadrants_url, notice: "L'encadrant a bien été mis à jour."
    else
      render :edit
    end
  end

  # DELETE /encadrants/1
  def destroy
    @encadrant.destroy
    redirect_to encadrants_url, notice: "L'encadrant a bien été effacé."
  end

  private ######################################################################

    def set_encadrant
      @encadrant = Encadrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow this white list
    def encadrant_params
      params.require(:encadrant).permit(:nom)
    end
end
