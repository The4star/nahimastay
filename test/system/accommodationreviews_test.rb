require "application_system_test_case"

class AccommodationreviewsTest < ApplicationSystemTestCase
  setup do
    @accommodationreview = accommodationreviews(:one)
  end

  test "visiting the index" do
    visit accommodationreviews_url
    assert_selector "h1", text: "Accommodationreviews"
  end

  test "creating a Accommodationreview" do
    visit accommodationreviews_url
    click_on "New Accommodationreview"

    fill_in "Ammenities rating", with: @accommodationreview.ammenities_rating
    fill_in "Cleanliness rating", with: @accommodationreview.cleanliness_rating
    fill_in "Comments", with: @accommodationreview.comments
    fill_in "Communication rating", with: @accommodationreview.communication_rating
    fill_in "Created at", with: @accommodationreview.created_at
    fill_in "Host rating", with: @accommodationreview.host_rating
    fill_in "Location rating", with: @accommodationreview.location_rating
    fill_in "Stay", with: @accommodationreview.stay_id
    click_on "Create Accommodationreview"

    assert_text "Accommodationreview was successfully created"
    click_on "Back"
  end

  test "updating a Accommodationreview" do
    visit accommodationreviews_url
    click_on "Edit", match: :first

    fill_in "Ammenities rating", with: @accommodationreview.ammenities_rating
    fill_in "Cleanliness rating", with: @accommodationreview.cleanliness_rating
    fill_in "Comments", with: @accommodationreview.comments
    fill_in "Communication rating", with: @accommodationreview.communication_rating
    fill_in "Created at", with: @accommodationreview.created_at
    fill_in "Host rating", with: @accommodationreview.host_rating
    fill_in "Location rating", with: @accommodationreview.location_rating
    fill_in "Stay", with: @accommodationreview.stay_id
    click_on "Update Accommodationreview"

    assert_text "Accommodationreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Accommodationreview" do
    visit accommodationreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accommodationreview was successfully destroyed"
  end
end
