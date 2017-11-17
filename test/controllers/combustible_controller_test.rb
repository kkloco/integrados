require 'test_helper'

class CombustibleControllerTest < ActionDispatch::IntegrationTest
  test "should get show," do
    get combustible_show,_url
    assert_response :success
  end

  test "should get new," do
    get combustible_new,_url
    assert_response :success
  end

  test "should get edit" do
    get combustible_edit_url
    assert_response :success
  end

end
