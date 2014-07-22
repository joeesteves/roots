require 'test_helper'

class Rba::LotesControllerTest < ActionController::TestCase
  setup do
    @rba_lote = rba_lotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_lote" do
    assert_difference('Rba::Lote.count') do
      post :create, rba_lote: { codigo: @rba_lote.codigo, desc: @rba_lote.desc, establecimiento_id: @rba_lote.establecimiento_id, estado: @rba_lote.estado, nombre: @rba_lote.nombre }
    end

    assert_redirected_to rba_lote_path(assigns(:rba_lote))
  end

  test "should show rba_lote" do
    get :show, id: @rba_lote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_lote
    assert_response :success
  end

  test "should update rba_lote" do
    patch :update, id: @rba_lote, rba_lote: { codigo: @rba_lote.codigo, desc: @rba_lote.desc, establecimiento_id: @rba_lote.establecimiento_id, estado: @rba_lote.estado, nombre: @rba_lote.nombre }
    assert_redirected_to rba_lote_path(assigns(:rba_lote))
  end

  test "should destroy rba_lote" do
    assert_difference('Rba::Lote.count', -1) do
      delete :destroy, id: @rba_lote
    end

    assert_redirected_to rba_lotes_path
  end
end
