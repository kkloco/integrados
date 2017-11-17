require 'test_helper'

class CargosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cargos_show_url
    assert_response :success
  end

  test "should get new" do
    get cargos_new_url
    assert_response :success
  end

  test "should get edit" do
    get cargos_edit_url
    assert_response :success
  end

end
