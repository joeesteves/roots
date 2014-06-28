require 'test_helper'

class Rco::AsientosControllerTest < ActionController::TestCase
  setup do
    @rco_asiento = rco_asientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_asientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_asiento" do
    assert_difference('Rco::Asiento.count') do
      post :create, rco_asiento: { cotizacion: @rco_asiento.cotizacion, desc: @rco_asiento.desc, fecha: @rco_asiento.fecha, moneda_id: @rco_asiento.moneda_id }
    end

    assert_redirected_to rco_asiento_path(assigns(:rco_asiento))
  end

  test "should show rco_asiento" do
    get :show, id: @rco_asiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_asiento
    assert_response :success
  end

  test "should update rco_asiento" do
    patch :update, id: @rco_asiento, rco_asiento: { cotizacion: @rco_asiento.cotizacion, desc: @rco_asiento.desc, fecha: @rco_asiento.fecha, moneda_id: @rco_asiento.moneda_id }
    assert_redirected_to rco_asiento_path(assigns(:rco_asiento))
  end

  test "should destroy rco_asiento" do
    assert_difference('Rco::Asiento.count', -1) do
      delete :destroy, id: @rco_asiento
    end

    assert_redirected_to rco_asientos_path
  end
end
