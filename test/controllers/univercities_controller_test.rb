require 'test_helper'

class UnivercitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get univercities_index_url
    assert_response :success
  end

  test "should get show" do
    get univercities_show_url
    assert_response :success
  end

end
