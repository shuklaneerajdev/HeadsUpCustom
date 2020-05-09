require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get default" do
    get home_default_url
    assert_response :success
  end

end
