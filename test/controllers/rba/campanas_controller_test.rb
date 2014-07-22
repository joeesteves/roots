require 'test_helper'

class Rba::CampanasControllerTest < ActionController::TestCase
  setup do
    @rba_campana = rba_campanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_campanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_campana" do
    assert_difference('Rba::Campana.count') do
      post :create, rba_campana: { campanatipo_id: @rba_campana.campanatipo_id, codigo: @rba_campana.codigo, desc: @rba_campana.desc, estado: @rba_campana.estado, nombre: @rba_campana.nombre, temporada_id: @rba_campana.temporada_id }
    end

    assert_redirected_to rba_campana_path(assigns(:rba_campana))
  end

  test "should show rba_campana" do
    get :show, id: @rba_campana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_campana
    assert_response :success
  end

  test "should update rba_campana" do
    patch :update, id: @rba_campana, rba_campana: { campanatipo_id: @rba_campana.campanatipo_id, codigo: @rba_campana.codigo, desc: @rba_campana.desc, estado: @rba_campana.estado, nombre: @rba_campana.nombre, temporada_id: @rba_campana.temporada_id }
    assert_redirected_to rba_campana_path(assigns(:rba_campana))
  end

  test "should destroy rba_campana" do
    assert_difference('Rba::Campana.count', -1) do
      delete :destroy, id: @rba_campana
    end

    assert_redirected_to rba_campanas_path
  end
end
