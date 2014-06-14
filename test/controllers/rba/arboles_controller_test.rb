require 'test_helper'

class Rba::ArbolesControllerTest < ActionController::TestCase
  setup do
    @rba_arbol = rba_arboles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_arboles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_arbol" do
    assert_difference('Rba::Arbol.count') do
      post :create, rba_arbol: { model_id: @rba_arbol.model_id, nombre: @rba_arbol.nombre }
    end

    assert_redirected_to rba_arbol_path(assigns(:rba_arbol))
  end

  test "should show rba_arbol" do
    get :show, id: @rba_arbol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_arbol
    assert_response :success
  end

  test "should update rba_arbol" do
    patch :update, id: @rba_arbol, rba_arbol: { model_id: @rba_arbol.model_id, nombre: @rba_arbol.nombre }
    assert_redirected_to rba_arbol_path(assigns(:rba_arbol))
  end

  test "should destroy rba_arbol" do
    assert_difference('Rba::Arbol.count', -1) do
      delete :destroy, id: @rba_arbol
    end

    assert_redirected_to rba_arboles_path
  end
end
