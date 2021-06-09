require "test_helper"

class FirstlookControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get firstlook_new_url
    assert_response :success
  end

  test "should get create" do
    get firstlook_create_url
    assert_response :success
  end
end
