require 'test_helper'

class ProveedoresControllerTest < ActionDispatch::IntegrationTest
  test "should get show,new,edit" do
    get proveedores_show,new,edit_url
    assert_response :success
  end

end
