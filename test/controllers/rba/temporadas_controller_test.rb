require 'test_helper'

class Rba::TemporadasControllerTest < ActionController::TestCase
  setup do
    @rba_temporada = rba_temporadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_temporadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_temporada" do
    assert_difference('Rba::Temporada.count') do
      post :create, rba_temporada: { codigo: @rba_temporada.codigo, desc: @rba_temporada.desc, desde: @rba_temporada.desde, estado: @rba_temporada.estado, hasta: @rba_temporada.hasta, nombre: @rba_temporada.nombre }
    end

    assert_redirected_to rba_temporada_path(assigns(:rba_temporada))
  end

  test "should show rba_temporada" do
    get :show, id: @rba_temporada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_temporada
    assert_response :success
  end

  test "should update rba_temporada" do
    patch :update, id: @rba_temporada, rba_temporada: { codigo: @rba_temporada.codigo, desc: @rba_temporada.desc, desde: @rba_temporada.desde, estado: @rba_temporada.estado, hasta: @rba_temporada.hasta, nombre: @rba_temporada.nombre }
    assert_redirected_to rba_temporada_path(assigns(:rba_temporada))
  end

  test "should destroy rba_temporada" do
    assert_difference('Rba::Temporada.count', -1) do
      delete :destroy, id: @rba_temporada
    end

    assert_redirected_to rba_temporadas_path
  end
end
