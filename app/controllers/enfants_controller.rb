class EnfantsController < ApplicationController
  before_action :set_enfant, only: [:edit, :update, :destroy]

  # GET /enfants
  def index
    @enfants = Enfant.all.order_by_name
  end

  # GET /enfants/new
  def new
    @enfant = Enfant.new
  end

  # GET /enfants/1/edit
  def edit
  end

  # POST /enfants
  def create
    @enfant = Enfant.new(enfant_params)

    if @enfant.save
      redirect_to @enfant, notice: "Le nouvel enfant a bien été créé."
    else
      render :new
    end
  end

  # PATCH/PUT /enfants/1
  def update
    if @enfant.update(enfant_params)
      redirect_to @enfant, notice: "L'enfant a bien été mis à jour."
    else
      render :edit
    end
  end

  # DELETE /enfants/1
  def destroy
    @enfant.destroy
    redirect_to enfants_url, notice: "L'enfant a bien été supprimé."
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
