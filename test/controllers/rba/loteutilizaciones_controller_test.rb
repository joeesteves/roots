require 'test_helper'

class Rba::LoteutilizacionesControllerTest < ActionController::TestCase
  setup do
    @rba_loteutilizacion = rba_loteutilizaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_loteutilizaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_loteutilizacion" do
    assert_difference('Rba::Loteutilizacion.count') do
      post :create, rba_loteutilizacion: { actividad_id: @rba_loteutilizacion.actividad_id, campana_id: @rba_loteutilizacion.campana_id, codigo: @rba_loteutilizacion.codigo, desc: @rba_loteutilizacion.desc, estado: @rba_loteutilizacion.estado, lote_id: @rba_loteutilizacion.lote_id, nombre: @rba_loteutilizacion.nombre, superficie: @rba_loteutilizacion.superficie }
    end

    assert_redirected_to rba_loteutilizacion_path(assigns(:rba_loteutilizacion))
  end

  test "should show rba_loteutilizacion" do
    get :show, id: @rba_loteutilizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_loteutilizacion
    assert_response :success
  end

  test "should update rba_loteutilizacion" do
    patch :update, id: @rba_loteutilizacion, rba_loteutilizacion: { actividad_id: @rba_loteutilizacion.actividad_id, campana_id: @rba_loteutilizacion.campana_id, codigo: @rba_loteutilizacion.codigo, desc: @rba_loteutilizacion.desc, estado: @rba_loteutilizacion.estado, lote_id: @rba_loteutilizacion.lote_id, nombre: @rba_loteutilizacion.nombre, superficie: @rba_loteutilizacion.superficie }
    assert_redirected_to rba_loteutilizacion_path(assigns(:rba_loteutilizacion))
  end

  test "should destroy rba_loteutilizacion" do
    assert_difference('Rba::Loteutilizacion.count', -1) do
      delete :destroy, id: @rba_loteutilizacion
    end

    assert_redirected_to rba_loteutilizaciones_path
  end
end
