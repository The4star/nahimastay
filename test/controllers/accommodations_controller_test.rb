require 'test_helper'

class AccommodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodation = accommodations(:one)
  end

  test "should get index" do
    get accommodations_url
    assert_response :success
  end

  test "should get new" do
    get new_accommodation_url
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post accommodations_url, params: { accommodation: { accommodation_rating: @accommodation.accommodation_rating, accomtype_id: @accommodation.accomtype_id, address: @accommodation.address, available_end_date: @accommodation.available_end_date, available_start_date: @accommodation.available_start_date, city: @accommodation.city, country: @accommodation.country, date_created: @accommodation.date_created, description: @accommodation.description, name: @accommodation.name, user_id: @accommodation.user_id } }
    end

    assert_redirected_to accommodation_url(Accommodation.last)
  end

  test "should show accommodation" do
    get accommodation_url(@accommodation)
    assert_response :success
  end

  test "should get edit" do
    get edit_accommodation_url(@accommodation)
    assert_response :success
  end

  test "should update accommodation" do
    patch accommodation_url(@accommodation), params: { accommodation: { accommodation_rating: @accommodation.accommodation_rating, accomtype_id: @accommodation.accomtype_id, address: @accommodation.address, available_end_date: @accommodation.available_end_date, available_start_date: @accommodation.available_start_date, city: @accommodation.city, country: @accommodation.country, date_created: @accommodation.date_created, description: @accommodation.description, name: @accommodation.name, user_id: @accommodation.user_id } }
    assert_redirected_to accommodation_url(@accommodation)
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete accommodation_url(@accommodation)
    end

    assert_redirected_to accommodations_url
  end
end
