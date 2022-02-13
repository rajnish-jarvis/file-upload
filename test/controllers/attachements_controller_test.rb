require "test_helper"

class AttachementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attachement = attachements(:one)
  end

  test "should get index" do
    get attachements_url
    assert_response :success
  end

  test "should get new" do
    get new_attachement_url
    assert_response :success
  end

  test "should create attachement" do
    assert_difference('Attachement.count') do
      post attachements_url, params: { attachement: { string: @attachement.string, title: @attachement.title } }
    end

    assert_redirected_to attachement_url(Attachement.last)
  end

  test "should show attachement" do
    get attachement_url(@attachement)
    assert_response :success
  end

  test "should get edit" do
    get edit_attachement_url(@attachement)
    assert_response :success
  end

  test "should update attachement" do
    patch attachement_url(@attachement), params: { attachement: { string: @attachement.string, title: @attachement.title } }
    assert_redirected_to attachement_url(@attachement)
  end

  test "should destroy attachement" do
    assert_difference('Attachement.count', -1) do
      delete attachement_url(@attachement)
    end

    assert_redirected_to attachements_url
  end
end
