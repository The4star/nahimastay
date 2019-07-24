require 'test_helper'

class AccommodationreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodationreview = accommodationreviews(:one)
  end

  test "should get index" do
    get accommodationreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_accommodationreview_url
    assert_response :success
  end

  test "should create accommodationreview" do
    assert_difference('Accommodationreview.count') do
      post accommodationreviews_url, params: { accommodationreview: { ammenities_rating: @accommodationreview.ammenities_rating, cleanliness_rating: @accommodationreview.cleanliness_rating, comments: @accommodationreview.comments, communication_rating: @accommodationreview.communication_rating, created_at: @accommodationreview.created_at, host_rating: @accommodationreview.host_rating, location_rating: @accommodationreview.location_rating, stay_id: @accommodationreview.stay_id } }
    end

    assert_redirected_to accommodationreview_url(Accommodationreview.last)
  end

  test "should show accommodationreview" do
    get accommodationreview_url(@accommodationreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_accommodationreview_url(@accommodationreview)
    assert_response :success
  end

  test "should update accommodationreview" do
    patch accommodationreview_url(@accommodationreview), params: { accommodationreview: { ammenities_rating: @accommodationreview.ammenities_rating, cleanliness_rating: @accommodationreview.cleanliness_rating, comments: @accommodationreview.comments, communication_rating: @accommodationreview.communication_rating, created_at: @accommodationreview.created_at, host_rating: @accommodationreview.host_rating, location_rating: @accommodationreview.location_rating, stay_id: @accommodationreview.stay_id } }
    assert_redirected_to accommodationreview_url(@accommodationreview)
  end

  test "should destroy accommodationreview" do
    assert_difference('Accommodationreview.count', -1) do
      delete accommodationreview_url(@accommodationreview)
    end

    assert_redirected_to accommodationreviews_url
  end
end
