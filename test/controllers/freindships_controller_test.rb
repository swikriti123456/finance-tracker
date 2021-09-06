require "test_helper"

class FreindshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get freindships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get freindships_destroy_url
    assert_response :success
  end
end
