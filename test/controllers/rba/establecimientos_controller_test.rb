require 'test_helper'

class Rba::EstablecimientosControllerTest < ActionController::TestCase
  setup do
    @rba_establecimiento = rba_establecimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_establecimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_establecimiento" do
    assert_difference('Rba::Establecimiento.count') do
      post :create, rba_establecimiento: { codigo: @rba_establecimiento.codigo, desc: @rba_establecimiento.desc, nombre: @rba_establecimiento.nombre, superficie: @rba_establecimiento.superficie }
    end

    assert_redirected_to rba_establecimiento_path(assigns(:rba_establecimiento))
  end

  test "should show rba_establecimiento" do
    get :show, id: @rba_establecimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_establecimiento
    assert_response :success
  end

  test "should update rba_establecimiento" do
    patch :update, id: @rba_establecimiento, rba_establecimiento: { codigo: @rba_establecimiento.codigo, desc: @rba_establecimiento.desc, nombre: @rba_establecimiento.nombre, superficie: @rba_establecimiento.superficie }
    assert_redirected_to rba_establecimiento_path(assigns(:rba_establecimiento))
  end

  test "should destroy rba_establecimiento" do
    assert_difference('Rba::Establecimiento.count', -1) do
      delete :destroy, id: @rba_establecimiento
    end

    assert_redirected_to rba_establecimientos_path
  end
end
