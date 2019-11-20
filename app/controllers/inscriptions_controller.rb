# frozen_string_literal: true

# Inscriptions Controller
class InscriptionsController < ApplicationController
  # POST /inscriptions
  def create
    @inscription = Inscription.new(inscription_params)

    respond_to do |format|
      if @inscription.save
        format.html { redirect_to root_url, notice: "L'inscription a bien été enregistrée" }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /inscriptions/1
  def destroy
    Inscription.find(params[:id]).destroy
    redirect_to root_url, notice: "L'inscription a été supprimée avec succès"
  end
end
