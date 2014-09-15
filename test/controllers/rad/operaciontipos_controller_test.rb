require 'test_helper'

class Rad::OperaciontiposControllerTest < ActionController::TestCase
  setup do
    @rad_operaciontipo = rad_operaciontipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rad_operaciontipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rad_operaciontipo" do
    assert_difference('Rad::Operaciontipo.count') do
      post :create, rad_operaciontipo: { codigo: @rad_operaciontipo.codigo, estado: @rad_operaciontipo.estado, nombre: @rad_operaciontipo.nombre }
    end

    assert_redirected_to rad_operaciontipo_path(assigns(:rad_operaciontipo))
  end

  test "should show rad_operaciontipo" do
    get :show, id: @rad_operaciontipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rad_operaciontipo
    assert_response :success
  end

  test "should update rad_operaciontipo" do
    patch :update, id: @rad_operaciontipo, rad_operaciontipo: { codigo: @rad_operaciontipo.codigo, estado: @rad_operaciontipo.estado, nombre: @rad_operaciontipo.nombre }
    assert_redirected_to rad_operaciontipo_path(assigns(:rad_operaciontipo))
  end

  test "should destroy rad_operaciontipo" do
    assert_difference('Rad::Operaciontipo.count', -1) do
      delete :destroy, id: @rad_operaciontipo
    end

    assert_redirected_to rad_operaciontipos_path
  end
end
