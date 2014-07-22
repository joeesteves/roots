require 'test_helper'

class Rba::ActividadesControllerTest < ActionController::TestCase
  setup do
    @rba_actividad = rba_actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_actividad" do
    assert_difference('Rba::Actividad.count') do
      post :create, rba_actividad: { actividadtipo_id: @rba_actividad.actividadtipo_id, codigo: @rba_actividad.codigo, desc: @rba_actividad.desc, estado: @rba_actividad.estado, nombre: @rba_actividad.nombre }
    end

    assert_redirected_to rba_actividad_path(assigns(:rba_actividad))
  end

  test "should show rba_actividad" do
    get :show, id: @rba_actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_actividad
    assert_response :success
  end

  test "should update rba_actividad" do
    patch :update, id: @rba_actividad, rba_actividad: { actividadtipo_id: @rba_actividad.actividadtipo_id, codigo: @rba_actividad.codigo, desc: @rba_actividad.desc, estado: @rba_actividad.estado, nombre: @rba_actividad.nombre }
    assert_redirected_to rba_actividad_path(assigns(:rba_actividad))
  end

  test "should destroy rba_actividad" do
    assert_difference('Rba::Actividad.count', -1) do
      delete :destroy, id: @rba_actividad
    end

    assert_redirected_to rba_actividades_path
  end
end
