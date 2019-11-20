# frozen_string_literal: true

# Inscriptions Controller
class InscriptionsController < ApplicationController
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
    respond_to do |format|
      if Inscription.find(params[:id]).destroy
        format.html do
          redirect_to root_url, notice: "Inscription supprimée avec succès."
        end
      else
        format.html do
          redirect_to root_url, alert: "Inscription non supprimée..."
        end
      end
    end
  end

  private ######################################################################

    # Never trust parameters from the scary internet, only allow this white list
    def inscription_params
      params.require(:inscription).permit(:enfant_id, :encadrant_id, :jour)
    end
end
