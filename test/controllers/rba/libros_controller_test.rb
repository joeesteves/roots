require 'test_helper'

class Rba::LibrosControllerTest < ActionController::TestCase
  setup do
    @rba_libro = rba_libros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_libros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_libro" do
    assert_difference('Rba::Libro.count') do
      post :create, rba_libro: { autor: @rba_libro.autor, categoria: @rba_libro.categoria, editorial: @rba_libro.editorial, nombre: @rba_libro.nombre }
    end

    assert_redirected_to rba_libro_path(assigns(:rba_libro))
  end

  test "should show rba_libro" do
    get :show, id: @rba_libro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_libro
    assert_response :success
  end

  test "should update rba_libro" do
    patch :update, id: @rba_libro, rba_libro: { autor: @rba_libro.autor, categoria: @rba_libro.categoria, editorial: @rba_libro.editorial, nombre: @rba_libro.nombre }
    assert_redirected_to rba_libro_path(assigns(:rba_libro))
  end

  test "should destroy rba_libro" do
    assert_difference('Rba::Libro.count', -1) do
      delete :destroy, id: @rba_libro
    end

    assert_redirected_to rba_libros_path
  end
end
