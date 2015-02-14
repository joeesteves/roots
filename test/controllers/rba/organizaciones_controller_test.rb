require 'test_helper'

class Rba::OrganizacionesControllerTest < ActionController::TestCase
  setup do
    @rba_organizacion = rba_organizaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_organizaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_organizacion" do
    assert_difference('Rba::Organizacion.count') do
      post :create, rba_organizacion: { catfiscal_id: @rba_organizacion.catfiscal_id, desc: @rba_organizacion.desc, estado: @rba_organizacion.estado, idfiscal: @rba_organizacion.idfiscal, nombre: @rba_organizacion.nombre, organizaciontipo_id: @rba_organizacion.organizaciontipo_id }
    end

    assert_redirected_to rba_organizacion_path(assigns(:rba_organizacion))
  end

  test "should show rba_organizacion" do
    get :show, id: @rba_organizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_organizacion
    assert_response :success
  end

  test "should update rba_organizacion" do
    patch :update, id: @rba_organizacion, rba_organizacion: { catfiscal_id: @rba_organizacion.catfiscal_id, desc: @rba_organizacion.desc, estado: @rba_organizacion.estado, idfiscal: @rba_organizacion.idfiscal, nombre: @rba_organizacion.nombre, organizaciontipo_id: @rba_organizacion.organizaciontipo_id }
    assert_redirected_to rba_organizacion_path(assigns(:rba_organizacion))
  end

  test "should destroy rba_organizacion" do
    assert_difference('Rba::Organizacion.count', -1) do
      delete :destroy, id: @rba_organizacion
    end

    assert_redirected_to rba_organizaciones_path
  end
end
