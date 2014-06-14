require 'test_helper'

class Rba::NodosControllerTest < ActionController::TestCase
  setup do
    @rba_nodo = rba_nodos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_nodos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_nodo" do
    assert_difference('Rba::Nodo.count') do
      post :create, rba_nodo: { arbol_id: @rba_nodo.arbol_id, nombre: @rba_nodo.nombre }
    end

    assert_redirected_to rba_nodo_path(assigns(:rba_nodo))
  end

  test "should show rba_nodo" do
    get :show, id: @rba_nodo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_nodo
    assert_response :success
  end

  test "should update rba_nodo" do
    patch :update, id: @rba_nodo, rba_nodo: { arbol_id: @rba_nodo.arbol_id, nombre: @rba_nodo.nombre }
    assert_redirected_to rba_nodo_path(assigns(:rba_nodo))
  end

  test "should destroy rba_nodo" do
    assert_difference('Rba::Nodo.count', -1) do
      delete :destroy, id: @rba_nodo
    end

    assert_redirected_to rba_nodos_path
  end
end
