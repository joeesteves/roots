require 'test_helper'

class Rga::CategoriasControllerTest < ActionController::TestCase
  setup do
    @rga_categoria = rga_categorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_categorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_categoria" do
    assert_difference('Rga::Categoria.count') do
      post :create, rga_categoria: { categoriatipo_id: @rga_categoria.categoriatipo_id, codigo: @rga_categoria.codigo, desc: @rga_categoria.desc, estado: @rga_categoria.estado, nombre: @rga_categoria.nombre }
    end

    assert_redirected_to rga_categoria_path(assigns(:rga_categoria))
  end

  test "should show rga_categoria" do
    get :show, id: @rga_categoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_categoria
    assert_response :success
  end

  test "should update rga_categoria" do
    patch :update, id: @rga_categoria, rga_categoria: { categoriatipo_id: @rga_categoria.categoriatipo_id, codigo: @rga_categoria.codigo, desc: @rga_categoria.desc, estado: @rga_categoria.estado, nombre: @rga_categoria.nombre }
    assert_redirected_to rga_categoria_path(assigns(:rga_categoria))
  end

  test "should destroy rga_categoria" do
    assert_difference('Rga::Categoria.count', -1) do
      delete :destroy, id: @rga_categoria
    end

    assert_redirected_to rga_categorias_path
  end
end
