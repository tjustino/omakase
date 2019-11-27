# frozen_string_literal: true

require "test_helper"

# Encadrants Controller Test
class EncadrantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encadrant = encadrants(:one)
  end

  test "should get index" do
    get encadrants_url
    assert_response :success
  end

  test "should get new" do
    get new_encadrant_url
    assert_response :success
  end

  test "should create encadrant" do
    assert_difference("Encadrant.count") do
      post encadrants_url, params: { encadrant: { nom: @encadrant.nom } }
    end

    assert_redirected_to encadrant_url(Encadrant.last)
  end

  test "should show encadrant" do
    get encadrant_url(@encadrant)
    assert_response :success
  end

  test "should get edit" do
    get edit_encadrant_url(@encadrant)
    assert_response :success
  end

  test "should update encadrant" do
    patch encadrant_url(@encadrant), params: {
      encadrant: { nom: @encadrant.nom }
    }
    assert_redirected_to encadrant_url(@encadrant)
  end

  test "should destroy encadrant" do
    assert_difference("Encadrant.count", -1) do
      delete encadrant_url(@encadrant)
    end

    assert_redirected_to encadrants_url
  end
end
