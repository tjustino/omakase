# frozen_string_literal: true

# Inscription model
class Inscription < ApplicationRecord
  belongs_to :enfant
  belongs_to :encadrant

  enum jour: { lundi: 0, mardi: 1, mercredi: 2, jeudi: 3, vendredi: 4 }

  private ######################################################################

  def self.encadrants(jour, enfant)
    encadrants = []
    rows = select(:encadrant_id).where(jour: jour, enfant: enfant.id)

    rows.each { |row| encadrants << row.encadrant_id }

    Encadrant.find(encadrants)
  end

  def self.enfants_par_nb_encadrants(jour, enfants_exclus, encadrants_exclus)
    select(:enfant_id).where(jour: jour)
                      .where.not(enfant_id: enfants_exclus)
                      .where.not(encadrant_id: encadrants_exclus)
                      .group(:enfant_id)
                      .order('count_enfant_id ASC')
                      .count
  end
end
