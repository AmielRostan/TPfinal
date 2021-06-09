require "application_system_test_case"

class RentsTest < ApplicationSystemTestCase
  setup do
    @rent = rents(:one)
  end

  test "visiting the index" do
    visit rents_url
    assert_selector "h1", text: "Rents"
  end

  test "creating a Rent" do
    visit rents_url
    click_on "New Rent"

    fill_in "Begins at", with: @rent.begins_at
    fill_in "Ends at", with: @rent.ends_at
    fill_in "Pay", with: @rent.pay
    fill_in "Person", with: @rent.person_id
    fill_in "Vehicle", with: @rent.vehicle_id
    click_on "Create Rent"

    assert_text "Rent was successfully created"
    click_on "Back"
  end

  test "updating a Rent" do
    visit rents_url
    click_on "Edit", match: :first

    fill_in "Begins at", with: @rent.begins_at
    fill_in "Ends at", with: @rent.ends_at
    fill_in "Pay", with: @rent.pay
    fill_in "Person", with: @rent.person_id
    fill_in "Vehicle", with: @rent.vehicle_id
    click_on "Update Rent"

    assert_text "Rent was successfully updated"
    click_on "Back"
  end

  test "destroying a Rent" do
    visit rents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rent was successfully destroyed"
  end
end
