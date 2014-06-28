require 'test_helper'

class Rco::MonedasControllerTest < ActionController::TestCase
  setup do
    @rco_moneda = rco_monedas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_monedas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_moneda" do
    assert_difference('Rco::Moneda.count') do
      post :create, rco_moneda: { codigo: @rco_moneda.codigo, nombre: @rco_moneda.nombre }
    end

    assert_redirected_to rco_moneda_path(assigns(:rco_moneda))
  end

  test "should show rco_moneda" do
    get :show, id: @rco_moneda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_moneda
    assert_response :success
  end

  test "should update rco_moneda" do
    patch :update, id: @rco_moneda, rco_moneda: { codigo: @rco_moneda.codigo, nombre: @rco_moneda.nombre }
    assert_redirected_to rco_moneda_path(assigns(:rco_moneda))
  end

  test "should destroy rco_moneda" do
    assert_difference('Rco::Moneda.count', -1) do
      delete :destroy, id: @rco_moneda
    end

    assert_redirected_to rco_monedas_path
  end
end
