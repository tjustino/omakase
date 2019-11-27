# frozen_string_literal: true

require "application_system_test_case"

# Encadrants Test
class EncadrantsTest < ApplicationSystemTestCase
  setup do
    @encadrant = encadrants(:one)
  end

  test "visiting the index" do
    visit encadrants_url
    assert_selector "h1", text: "Encadrants"
  end

  test "creating a Encadrant" do
    visit encadrants_url
    click_on "New Encadrant"

    fill_in "Nom", with: @encadrant.nom
    click_on "Create Encadrant"

    assert_text "Encadrant was successfully created"
    click_on "Back"
  end

  test "updating a Encadrant" do
    visit encadrants_url
    click_on "Edit", match: :first

    fill_in "Nom", with: @encadrant.nom
    click_on "Update Encadrant"

    assert_text "Encadrant was successfully updated"
    click_on "Back"
  end

  test "destroying a Encadrant" do
    visit encadrants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Encadrant was successfully destroyed"
  end
end
