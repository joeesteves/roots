require 'test_helper'

class Rco::CuentasControllerTest < ActionController::TestCase
  setup do
    @rco_cuenta = rco_cuentas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_cuentas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_cuenta" do
    assert_difference('Rco::Cuenta.count') do
      post :create, rco_cuenta: { codigo: @rco_cuenta.codigo, cuentatipo_id: @rco_cuenta.cuentatipo_id, desc: @rco_cuenta.desc, estado: @rco_cuenta.estado, nombre: @rco_cuenta.nombre, rba_empresagrupo_id: @rco_cuenta.rba_empresagrupo_id }
    end

    assert_redirected_to rco_cuenta_path(assigns(:rco_cuenta))
  end

  test "should show rco_cuenta" do
    get :show, id: @rco_cuenta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_cuenta
    assert_response :success
  end

  test "should update rco_cuenta" do
    patch :update, id: @rco_cuenta, rco_cuenta: { codigo: @rco_cuenta.codigo, cuentatipo_id: @rco_cuenta.cuentatipo_id, desc: @rco_cuenta.desc, estado: @rco_cuenta.estado, nombre: @rco_cuenta.nombre, rba_empresagrupo_id: @rco_cuenta.rba_empresagrupo_id }
    assert_redirected_to rco_cuenta_path(assigns(:rco_cuenta))
  end

  test "should destroy rco_cuenta" do
    assert_difference('Rco::Cuenta.count', -1) do
      delete :destroy, id: @rco_cuenta
    end

    assert_redirected_to rco_cuentas_path
  end
end
