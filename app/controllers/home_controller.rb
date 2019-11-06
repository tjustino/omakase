# frozen_string_literal: true

# Master Controller
class HomeController < ApplicationController
  before_action :set_enfants, :set_jours, :set_inscriptions

  # GET /
  def index
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
        @erreur = "Plus d'encadrants doivent s'incrire pour un résultat complet !"
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
end
