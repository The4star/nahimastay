require "application_system_test_case"

class StaysTest < ApplicationSystemTestCase
  setup do
    @stay = stays(:one)
  end

  test "visiting the index" do
    visit stays_url
    assert_selector "h1", text: "Stays"
  end

  test "creating a Stay" do
    visit stays_url
    click_on "New Stay"

    fill_in "Accommodation", with: @stay.accommodation_id
    check "Confirmed" if @stay.confirmed
    fill_in "Created at", with: @stay.created_at
    fill_in "End date", with: @stay.end_date
    check "Rejected" if @stay.rejected
    fill_in "Start date", with: @stay.start_date
    fill_in "User", with: @stay.user_id
    click_on "Create Stay"

    assert_text "Stay was successfully created"
    click_on "Back"
  end

  test "updating a Stay" do
    visit stays_url
    click_on "Edit", match: :first

    fill_in "Accommodation", with: @stay.accommodation_id
    check "Confirmed" if @stay.confirmed
    fill_in "Created at", with: @stay.created_at
    fill_in "End date", with: @stay.end_date
    check "Rejected" if @stay.rejected
    fill_in "Start date", with: @stay.start_date
    fill_in "User", with: @stay.user_id
    click_on "Update Stay"

    assert_text "Stay was successfully updated"
    click_on "Back"
  end

  test "destroying a Stay" do
    visit stays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stay was successfully destroyed"
  end
end
