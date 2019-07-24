require "application_system_test_case"

class GuestreviewsTest < ApplicationSystemTestCase
  setup do
    @guestreview = guestreviews(:one)
  end

  test "visiting the index" do
    visit guestreviews_url
    assert_selector "h1", text: "Guestreviews"
  end

  test "creating a Guestreview" do
    visit guestreviews_url
    click_on "New Guestreview"

    fill_in "Cleanliness rating", with: @guestreview.cleanliness_rating
    fill_in "Comments", with: @guestreview.comments
    fill_in "Communication rating", with: @guestreview.communication_rating
    fill_in "Created at", with: @guestreview.created_at
    fill_in "Ease of hosting rating", with: @guestreview.ease_of_hosting_rating
    fill_in "Stay", with: @guestreview.stay_id
    click_on "Create Guestreview"

    assert_text "Guestreview was successfully created"
    click_on "Back"
  end

  test "updating a Guestreview" do
    visit guestreviews_url
    click_on "Edit", match: :first

    fill_in "Cleanliness rating", with: @guestreview.cleanliness_rating
    fill_in "Comments", with: @guestreview.comments
    fill_in "Communication rating", with: @guestreview.communication_rating
    fill_in "Created at", with: @guestreview.created_at
    fill_in "Ease of hosting rating", with: @guestreview.ease_of_hosting_rating
    fill_in "Stay", with: @guestreview.stay_id
    click_on "Update Guestreview"

    assert_text "Guestreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Guestreview" do
    visit guestreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guestreview was successfully destroyed"
  end
end
