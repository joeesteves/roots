require 'test_helper'

class Rba::CampanatiposControllerTest < ActionController::TestCase
  setup do
    @rba_campanatipo = rba_campanatipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_campanatipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_campanatipo" do
    assert_difference('Rba::Campanatipo.count') do
      post :create, rba_campanatipo: { codigo: @rba_campanatipo.codigo, desc: @rba_campanatipo.desc, estado: @rba_campanatipo.estado, nombre: @rba_campanatipo.nombre }
    end

    assert_redirected_to rba_campanatipo_path(assigns(:rba_campanatipo))
  end

  test "should show rba_campanatipo" do
    get :show, id: @rba_campanatipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_campanatipo
    assert_response :success
  end

  test "should update rba_campanatipo" do
    patch :update, id: @rba_campanatipo, rba_campanatipo: { codigo: @rba_campanatipo.codigo, desc: @rba_campanatipo.desc, estado: @rba_campanatipo.estado, nombre: @rba_campanatipo.nombre }
    assert_redirected_to rba_campanatipo_path(assigns(:rba_campanatipo))
  end

  test "should destroy rba_campanatipo" do
    assert_difference('Rba::Campanatipo.count', -1) do
      delete :destroy, id: @rba_campanatipo
    end

    assert_redirected_to rba_campanatipos_path
  end
end
