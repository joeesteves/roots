require 'test_helper'

class Rga::EventotiposControllerTest < ActionController::TestCase
  setup do
    @rga_eventotipo = rga_eventotipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_eventotipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_eventotipo" do
    assert_difference('Rga::Eventotipo.count') do
      post :create, rga_eventotipo: { codigo: @rga_eventotipo.codigo, desc: @rga_eventotipo.desc, estado: @rga_eventotipo.estado, nombre: @rga_eventotipo.nombre }
    end

    assert_redirected_to rga_eventotipo_path(assigns(:rga_eventotipo))
  end

  test "should show rga_eventotipo" do
    get :show, id: @rga_eventotipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_eventotipo
    assert_response :success
  end

  test "should update rga_eventotipo" do
    patch :update, id: @rga_eventotipo, rga_eventotipo: { codigo: @rga_eventotipo.codigo, desc: @rga_eventotipo.desc, estado: @rga_eventotipo.estado, nombre: @rga_eventotipo.nombre }
    assert_redirected_to rga_eventotipo_path(assigns(:rga_eventotipo))
  end

  test "should destroy rga_eventotipo" do
    assert_difference('Rga::Eventotipo.count', -1) do
      delete :destroy, id: @rga_eventotipo
    end

    assert_redirected_to rga_eventotipos_path
  end
end
