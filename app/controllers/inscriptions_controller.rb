# frozen_string_literal: true

# Inscriptions Controller
class InscriptionsController < ApplicationController
  before_action :set_enfants, :set_jours, :set_inscriptions

  # GET /
  def index; end

  # POST /inscriptions
  def create
    @inscription = Inscription.new(inscription_params)

    respond_to do |format|
      if @inscription.save
        format.html do
          redirect_to root_url, notice: "L'inscription a bien été enregistrée"
        end
      end
    end
  end

  # DELETE /inscriptions/1
  def destroy
    @inscription = Inscription.find(params[:id])
    if @inscription.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Inscription supprimée." }
        format.js
      end
    else
      redirect_to root_url, alert: "Inscription non supprimée..."
    end
  end

  # GET /dice
  def dice
    @proposition = []
    nb_enfants = @enfants.count

    @jours.each_key do |jour|
      enfants_exclus = []
      encadrants_exclus = []

      begin
        until encadrants_exclus.count == nb_enfants
          enfant_id = @inscriptions.enfants_par_nb_encadrants(jour, enfants_exclus, encadrants_exclus).keys[0]
          encadrant_id = @inscriptions.encadrants(jour, Enfant.find(enfant_id), encadrants_exclus).sample.id

          enfants_exclus << enfant_id
          encadrants_exclus << encadrant_id

          @proposition << { jour: jour, enfant: enfant_id, encadrant: encadrant_id }
        end
      rescue ActiveRecord::RecordNotFound => e
        flash[:alert] = "Plus d'encadrants doivent s'incrire pour un résultat complet !"
      end
    end
  end

  private ######################################################################

    def set_enfants
      @enfants = Enfant.all.order_by_name
    end

    def set_jours
      @jours = Inscription.jours
    end

    def set_inscriptions
      @inscriptions = Inscription.all
    end

    # Never trust parameters from the scary internet, only allow this white list
    def inscription_params
      params.require(:inscription).permit(:enfant_id, :encadrant_id, :jour)
    end
end
