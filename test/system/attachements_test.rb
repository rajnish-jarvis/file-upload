require "application_system_test_case"

class AttachementsTest < ApplicationSystemTestCase
  setup do
    @attachement = attachements(:one)
  end

  test "visiting the index" do
    visit attachements_url
    assert_selector "h1", text: "Attachements"
  end

  test "creating a Attachement" do
    visit attachements_url
    click_on "New Attachement"

    fill_in "String", with: @attachement.string
    fill_in "Title", with: @attachement.title
    click_on "Create Attachement"

    assert_text "Attachement was successfully created"
    click_on "Back"
  end

  test "updating a Attachement" do
    visit attachements_url
    click_on "Edit", match: :first

    fill_in "String", with: @attachement.string
    fill_in "Title", with: @attachement.title
    click_on "Update Attachement"

    assert_text "Attachement was successfully updated"
    click_on "Back"
  end

  test "destroying a Attachement" do
    visit attachements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attachement was successfully destroyed"
  end
end
