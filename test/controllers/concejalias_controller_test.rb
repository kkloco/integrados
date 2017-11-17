require 'test_helper'

class ConcejaliasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get concejalias_new_url
    assert_response :success
  end

  test "should get edit" do
    get concejalias_edit_url
    assert_response :success
  end

  test "should get update" do
    get concejalias_update_url
    assert_response :success
  end

end
