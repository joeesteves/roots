require 'test_helper'

class Rco::CotizacionesControllerTest < ActionController::TestCase
  setup do
    @rco_cotizacion = rco_cotizaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rco_cotizaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rco_cotizacion" do
    assert_difference('Rco::Cotizacion.count') do
      post :create, rco_cotizacion: { cotizacion: @rco_cotizacion.cotizacion, fecha: @rco_cotizacion.fecha, moneda_id: @rco_cotizacion.moneda_id }
    end

    assert_redirected_to rco_cotizacion_path(assigns(:rco_cotizacion))
  end

  test "should show rco_cotizacion" do
    get :show, id: @rco_cotizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rco_cotizacion
    assert_response :success
  end

  test "should update rco_cotizacion" do
    patch :update, id: @rco_cotizacion, rco_cotizacion: { cotizacion: @rco_cotizacion.cotizacion, fecha: @rco_cotizacion.fecha, moneda_id: @rco_cotizacion.moneda_id }
    assert_redirected_to rco_cotizacion_path(assigns(:rco_cotizacion))
  end

  test "should destroy rco_cotizacion" do
    assert_difference('Rco::Cotizacion.count', -1) do
      delete :destroy, id: @rco_cotizacion
    end

    assert_redirected_to rco_cotizaciones_path
  end
end
