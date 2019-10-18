require "application_system_test_case"

class EnfantsTest < ApplicationSystemTestCase
  setup do
    @enfant = enfants(:one)
  end

  test "visiting the index" do
    visit enfants_url
    assert_selector "h1", text: "Enfants"
  end

  test "creating a Enfant" do
    visit enfants_url
    click_on "New Enfant"

    fill_in "Nom", with: @enfant.nom
    click_on "Create Enfant"

    assert_text "Enfant was successfully created"
    click_on "Back"
  end

  test "updating a Enfant" do
    visit enfants_url
    click_on "Edit", match: :first

    fill_in "Nom", with: @enfant.nom
    click_on "Update Enfant"

    assert_text "Enfant was successfully updated"
    click_on "Back"
  end

  test "destroying a Enfant" do
    visit enfants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enfant was successfully destroyed"
  end
end
