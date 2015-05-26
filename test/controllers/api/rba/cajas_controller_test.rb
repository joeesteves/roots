require 'test_helper'

class Api::Rba::CajasControllerTest < ActionController::TestCase
  test "should get cajas" do
    get :cajas
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
