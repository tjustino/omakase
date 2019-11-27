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

require "test_helper"

class EncadrantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
