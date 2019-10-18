class HomeController < ApplicationController
  before_action :set_enfants, :set_jours, :set_inscriptions

  # GET /
  # GET /home.json
  def index
  end

  # GET /dice
  # GET /dice.json
  def dice
    @jours.each_key do |jour|
      @enfants.each do |enfant|
        @toto = @inscriptions.encadrants(jour, enfant).count
        # @inscriptions.nb_encadrants_par_enfant(jour)
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
