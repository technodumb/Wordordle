require "test_helper"

class PlayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_index_url
    assert_response :success
  end

  test "should get create" do
    get play_create_url
    assert_response :success
  end

  test "should get join" do
    get play_join_url
    assert_response :success
  end
end
