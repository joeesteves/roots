require 'test_helper'

class Rco::RegistrosControllerTest < ActionController::TestCase
  setup do
    @rco_registro = rco_registros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_registros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_registro" do
    assert_difference('Rco::Registro.count') do
      post :create, rco_registro: { asiento_id: @rco_registro.asiento_id, cuenta_id: @rco_registro.cuenta_id, debe: @rco_registro.debe, desc: @rco_registro.desc, fecha: @rco_registro.fecha, haber: @rco_registro.haber, vencimiento: @rco_registro.vencimiento }
    end

    assert_redirected_to rco_registro_path(assigns(:rco_registro))
  end

  test "should show rco_registro" do
    get :show, id: @rco_registro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_registro
    assert_response :success
  end

  test "should update rco_registro" do
    patch :update, id: @rco_registro, rco_registro: { asiento_id: @rco_registro.asiento_id, cuenta_id: @rco_registro.cuenta_id, debe: @rco_registro.debe, desc: @rco_registro.desc, fecha: @rco_registro.fecha, haber: @rco_registro.haber, vencimiento: @rco_registro.vencimiento }
    assert_redirected_to rco_registro_path(assigns(:rco_registro))
  end

  test "should destroy rco_registro" do
    assert_difference('Rco::Registro.count', -1) do
      delete :destroy, id: @rco_registro
    end

    assert_redirected_to rco_registros_path
  end
end
