require 'test_helper'

class PropuestasControllerTest < ActionDispatch::IntegrationTest
  test "should get edit,new,show" do
    get propuestas_edit,new,show_url
    assert_response :success
  end

end
