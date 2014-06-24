require 'test_helper'

class Rco::CuentatiposControllerTest < ActionController::TestCase
  setup do
    @rco_cuentatipo = rco_cuentatipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_cuentatipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_cuentatipo" do
    assert_difference('Rco::Cuentatipo.count') do
      post :create, rco_cuentatipo: { codigo: @rco_cuentatipo.codigo, desc: @rco_cuentatipo.desc, estado: @rco_cuentatipo.estado, nombre: @rco_cuentatipo.nombre }
    end

    assert_redirected_to rco_cuentatipo_path(assigns(:rco_cuentatipo))
  end

  test "should show rco_cuentatipo" do
    get :show, id: @rco_cuentatipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_cuentatipo
    assert_response :success
  end

  test "should update rco_cuentatipo" do
    patch :update, id: @rco_cuentatipo, rco_cuentatipo: { codigo: @rco_cuentatipo.codigo, desc: @rco_cuentatipo.desc, estado: @rco_cuentatipo.estado, nombre: @rco_cuentatipo.nombre }
    assert_redirected_to rco_cuentatipo_path(assigns(:rco_cuentatipo))
  end

  test "should destroy rco_cuentatipo" do
    assert_difference('Rco::Cuentatipo.count', -1) do
      delete :destroy, id: @rco_cuentatipo
    end

    assert_redirected_to rco_cuentatipos_path
  end
end
