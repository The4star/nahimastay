require 'test_helper'

class GuestreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guestreview = guestreviews(:one)
  end

  test "should get index" do
    get guestreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_guestreview_url
    assert_response :success
  end

  test "should create guestreview" do
    assert_difference('Guestreview.count') do
      post guestreviews_url, params: { guestreview: { cleanliness_rating: @guestreview.cleanliness_rating, comments: @guestreview.comments, communication_rating: @guestreview.communication_rating, created_at: @guestreview.created_at, ease_of_hosting_rating: @guestreview.ease_of_hosting_rating, stay_id: @guestreview.stay_id } }
    end

    assert_redirected_to guestreview_url(Guestreview.last)
  end

  test "should show guestreview" do
    get guestreview_url(@guestreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_guestreview_url(@guestreview)
    assert_response :success
  end

  test "should update guestreview" do
    patch guestreview_url(@guestreview), params: { guestreview: { cleanliness_rating: @guestreview.cleanliness_rating, comments: @guestreview.comments, communication_rating: @guestreview.communication_rating, created_at: @guestreview.created_at, ease_of_hosting_rating: @guestreview.ease_of_hosting_rating, stay_id: @guestreview.stay_id } }
    assert_redirected_to guestreview_url(@guestreview)
  end

  test "should destroy guestreview" do
    assert_difference('Guestreview.count', -1) do
      delete guestreview_url(@guestreview)
    end

    assert_redirected_to guestreviews_url
  end
end
