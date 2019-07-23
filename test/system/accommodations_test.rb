require "application_system_test_case"

class AccommodationsTest < ApplicationSystemTestCase
  setup do
    @accommodation = accommodations(:one)
  end

  test "visiting the index" do
    visit accommodations_url
    assert_selector "h1", text: "Accommodations"
  end

  test "creating a Accommodation" do
    visit accommodations_url
    click_on "New Accommodation"

    fill_in "Accommodation rating", with: @accommodation.accommodation_rating
    fill_in "Accomtype", with: @accommodation.accomtype_id
    fill_in "Address", with: @accommodation.address
    fill_in "Available end date", with: @accommodation.available_end_date
    fill_in "Available start date", with: @accommodation.available_start_date
    fill_in "City", with: @accommodation.city
    fill_in "Country", with: @accommodation.country
    fill_in "Date created", with: @accommodation.date_created
    fill_in "Description", with: @accommodation.description
    fill_in "Name", with: @accommodation.name
    fill_in "User", with: @accommodation.user_id
    click_on "Create Accommodation"

    assert_text "Accommodation was successfully created"
    click_on "Back"
  end

  test "updating a Accommodation" do
    visit accommodations_url
    click_on "Edit", match: :first

    fill_in "Accommodation rating", with: @accommodation.accommodation_rating
    fill_in "Accomtype", with: @accommodation.accomtype_id
    fill_in "Address", with: @accommodation.address
    fill_in "Available end date", with: @accommodation.available_end_date
    fill_in "Available start date", with: @accommodation.available_start_date
    fill_in "City", with: @accommodation.city
    fill_in "Country", with: @accommodation.country
    fill_in "Date created", with: @accommodation.date_created
    fill_in "Description", with: @accommodation.description
    fill_in "Name", with: @accommodation.name
    fill_in "User", with: @accommodation.user_id
    click_on "Update Accommodation"

    assert_text "Accommodation was successfully updated"
    click_on "Back"
  end

  test "destroying a Accommodation" do
    visit accommodations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accommodation was successfully destroyed"
  end
end
