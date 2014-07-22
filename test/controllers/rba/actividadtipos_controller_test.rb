require 'test_helper'

class Rba::ActividadtiposControllerTest < ActionController::TestCase
  setup do
    @rba_actividadtipo = rba_actividadtipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_actividadtipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_actividadtipo" do
    assert_difference('Rba::Actividadtipo.count') do
      post :create, rba_actividadtipo: { codigo: @rba_actividadtipo.codigo, estado: @rba_actividadtipo.estado, nombre: @rba_actividadtipo.nombre }
    end

    assert_redirected_to rba_actividadtipo_path(assigns(:rba_actividadtipo))
  end

  test "should show rba_actividadtipo" do
    get :show, id: @rba_actividadtipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_actividadtipo
    assert_response :success
  end

  test "should update rba_actividadtipo" do
    patch :update, id: @rba_actividadtipo, rba_actividadtipo: { codigo: @rba_actividadtipo.codigo, estado: @rba_actividadtipo.estado, nombre: @rba_actividadtipo.nombre }
    assert_redirected_to rba_actividadtipo_path(assigns(:rba_actividadtipo))
  end

  test "should destroy rba_actividadtipo" do
    assert_difference('Rba::Actividadtipo.count', -1) do
      delete :destroy, id: @rba_actividadtipo
    end

    assert_redirected_to rba_actividadtipos_path
  end
end
