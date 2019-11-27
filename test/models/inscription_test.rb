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

require "test_helper"

class InscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
