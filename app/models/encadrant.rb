# frozen_string_literal: true

# == Schema Information
#
# Table name: encadrants
#
#  id         :integer          not null, primary key
#  nom        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_encadrants_on_nom  (nom) UNIQUE
#

# Encadrant model
class Encadrant < ApplicationRecord
  has_many :inscriptions, dependent: :destroy
  has_many :enfants, through: :inscriptions

  scope :order_by_name, -> { order(nom: :asc) }

  validates :nom, presence: true, uniqueness: true
end
