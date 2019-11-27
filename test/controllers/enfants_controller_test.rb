# frozen_string_literal: true

require "test_helper"

# Enfants Controller Test
class EnfantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enfant = enfants(:one)
  end

  test "should get index" do
    get enfants_url
    assert_response :success
  end

  test "should get new" do
    get new_enfant_url
    assert_response :success
  end

  test "should create enfant" do
    assert_difference("Enfant.count") do
      post enfants_url, params: { enfant: { nom: @enfant.nom } }
    end

    assert_redirected_to enfant_url(Enfant.last)
  end

  test "should show enfant" do
    get enfant_url(@enfant)
    assert_response :success
  end

  test "should get edit" do
    get edit_enfant_url(@enfant)
    assert_response :success
  end

  test "should update enfant" do
    patch enfant_url(@enfant), params: { enfant: { nom: @enfant.nom } }
    assert_redirected_to enfant_url(@enfant)
  end

  test "should destroy enfant" do
    assert_difference("Enfant.count", -1) do
      delete enfant_url(@enfant)
    end

    assert_redirected_to enfants_url
  end
end
