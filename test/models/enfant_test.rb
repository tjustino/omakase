# frozen_string_literal: true

# == Schema Information
#
# Table name: enfants
#
#  id         :integer          not null, primary key
#  nom        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_enfants_on_nom  (nom) UNIQUE
#

require "test_helper"

class EnfantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
