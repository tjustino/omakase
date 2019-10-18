# frozen_string_literal: true

# Inscription model
class Inscription < ApplicationRecord
  belongs_to :enfant
  belongs_to :encadrant

  # scope :encadrants_par_jour_par_enfant, -> { group(:jour, :enfant_id).count }

  enum jour: { lundi: 0, mardi: 1, mercredi: 2, jeudi: 3, vendredi: 4 }

  private ######################################################################

  # def self.matrix
  #   select(:jour,
  #          :enfant_id,
  #          "GROUP_CONCAT(inscriptions.encadrant_id) AS 'encadrant_ids'")
  #     .group(:jour, :enfant_id)
  # end

  def self.encadrants(jour, enfant)
    encadrants = []
    rows = select(:encadrant_id).where(jour: jour, enfant: enfant.id)

    rows.each { |row| encadrants << row.encadrant_id }

    Encadrant.find(encadrants)
  end

  # def self.nb_encadrants_par_enfant(jour)
  #   where(jour: jour).group(:jour, :enfant_id).order('count_all ASC').count
  # end
end
