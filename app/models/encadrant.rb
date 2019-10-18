# frozen_string_literal: true

# Encadrant model
class Encadrant < ApplicationRecord
  has_many :inscriptions
  has_many :enfants, through: :inscriptions

  scope :order_by_name, -> { order(nom: :asc) }
end
