# frozen_string_literal: true

# == Schema Information
#
# Table name: inscriptions
#
#  id           :integer        not null, primary key
#  enfant_id    :integer        not null
#  encadrant_id :integer        not null
#  jour         :integer        not null
#  created_at   :datetime       not null
#  updated_at   :datetime       not null
#
# Indexes
#
#  index_inscriptions_on_encadrant_id  (encadrant_id)
#  index_inscriptions_on_enfant_id     (enfant_id)
#  index_inscriptions_on_enfant_id_and_encadrant_id_and_jour
#                                         (enfant_id, encadrant_id, jour) UNIQUE
#

# Inscription model
class Inscription < ApplicationRecord
  belongs_to :enfant
  belongs_to :encadrant

  enum jour: { lundi: 0, mardi: 1, mercredi: 2, jeudi: 3, vendredi: 4 }

  validates :enfant_id, presence: true, uniqueness:
                                           { scope: %i[encadrant_id jour] }
  validates :encadrant_id, presence: true, uniqueness:
                                           { scope: %i[enfant_id jour] }
  validates :jour, presence: true, uniqueness:
                                           { scope: %i[enfant_id encadrant_id] }

  scope :intersection, ->(jour, enfant) { where(jour: jour, enfant: enfant) }

  # private ####################################################################
  class << self
    def encadrants(jour, enfant, encadrant_ids = [])
      encadrants = []
      rows = select(:encadrant_id).where(jour: jour, enfant: enfant.id)
                                  .where.not(encadrant_id: encadrant_ids)

      rows.each { |row| encadrants << row.encadrant_id }

      Encadrant.find(encadrants)
    end

    def enfants_par_nb_encadrants(jour, enfants_exclus, encadrants_exclus)
      select(:enfant_id).where(jour: jour)
                        .where.not(enfant_id: enfants_exclus)
                        .where.not(encadrant_id: encadrants_exclus)
                        .group(:enfant_id)
                        .order("count_enfant_id ASC")
                        .count
    end
  end
end
