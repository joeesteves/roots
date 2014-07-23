require 'test_helper'

class Rga::EstadosControllerTest < ActionController::TestCase
  setup do
    @rga_estado = rga_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_estado" do
    assert_difference('Rga::Estado.count') do
      post :create, rga_estado: { codigo: @rga_estado.codigo, desc: @rga_estado.desc, estado: @rga_estado.estado, nombre: @rga_estado.nombre }
    end

    assert_redirected_to rga_estado_path(assigns(:rga_estado))
  end

  test "should show rga_estado" do
    get :show, id: @rga_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_estado
    assert_response :success
  end

  test "should update rga_estado" do
    patch :update, id: @rga_estado, rga_estado: { codigo: @rga_estado.codigo, desc: @rga_estado.desc, estado: @rga_estado.estado, nombre: @rga_estado.nombre }
    assert_redirected_to rga_estado_path(assigns(:rga_estado))
  end

  test "should destroy rga_estado" do
    assert_difference('Rga::Estado.count', -1) do
      delete :destroy, id: @rga_estado
    end

    assert_redirected_to rga_estados_path
  end
end
