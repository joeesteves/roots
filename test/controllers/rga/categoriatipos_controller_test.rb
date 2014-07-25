require 'test_helper'

class Rga::CategoriatiposControllerTest < ActionController::TestCase
  setup do
    @rga_categoriatipo = rga_categoriatipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_categoriatipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_categoriatipo" do
    assert_difference('Rga::Categoriatipo.count') do
      post :create, rga_categoriatipo: { codigo: @rga_categoriatipo.codigo, desc: @rga_categoriatipo.desc, estado: @rga_categoriatipo.estado, nombre: @rga_categoriatipo.nombre }
    end

    assert_redirected_to rga_categoriatipo_path(assigns(:rga_categoriatipo))
  end

  test "should show rga_categoriatipo" do
    get :show, id: @rga_categoriatipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_categoriatipo
    assert_response :success
  end

  test "should update rga_categoriatipo" do
    patch :update, id: @rga_categoriatipo, rga_categoriatipo: { codigo: @rga_categoriatipo.codigo, desc: @rga_categoriatipo.desc, estado: @rga_categoriatipo.estado, nombre: @rga_categoriatipo.nombre }
    assert_redirected_to rga_categoriatipo_path(assigns(:rga_categoriatipo))
  end

  test "should destroy rga_categoriatipo" do
    assert_difference('Rga::Categoriatipo.count', -1) do
      delete :destroy, id: @rga_categoriatipo
    end

    assert_redirected_to rga_categoriatipos_path
  end
end
