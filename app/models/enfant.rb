# frozen_string_literal: true

# Enfant model
class Enfant < ApplicationRecord
  has_many :inscriptions
  has_many :encadrants, through: :inscriptions

  scope :order_by_name, -> { order(nom: :asc) }
end
