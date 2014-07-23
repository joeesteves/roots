require 'test_helper'

class Rga::RodeosControllerTest < ActionController::TestCase
  setup do
    @rga_rodeo = rga_rodeos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_rodeos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_rodeo" do
    assert_difference('Rga::Rodeo.count') do
      post :create, rga_rodeo: { codigo: @rga_rodeo.codigo, desc: @rga_rodeo.desc, estado: @rga_rodeo.estado, nombre: @rga_rodeo.nombre }
    end

    assert_redirected_to rga_rodeo_path(assigns(:rga_rodeo))
  end

  test "should show rga_rodeo" do
    get :show, id: @rga_rodeo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_rodeo
    assert_response :success
  end

  test "should update rga_rodeo" do
    patch :update, id: @rga_rodeo, rga_rodeo: { codigo: @rga_rodeo.codigo, desc: @rga_rodeo.desc, estado: @rga_rodeo.estado, nombre: @rga_rodeo.nombre }
    assert_redirected_to rga_rodeo_path(assigns(:rga_rodeo))
  end

  test "should destroy rga_rodeo" do
    assert_difference('Rga::Rodeo.count', -1) do
      delete :destroy, id: @rga_rodeo
    end

    assert_redirected_to rga_rodeos_path
  end
end
