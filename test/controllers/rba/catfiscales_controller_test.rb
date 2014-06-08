require 'test_helper'

class Rba::CatfiscalesControllerTest < ActionController::TestCase
  setup do
    @rba_catfiscal = rba_catfiscales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_catfiscales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_catfiscal" do
    assert_difference('Rba::Catfiscal.count') do
      post :create, rba_catfiscal: { codigo: @rba_catfiscal.codigo, desc: @rba_catfiscal.desc, nombre: @rba_catfiscal.nombre }
    end

    assert_redirected_to rba_catfiscal_path(assigns(:rba_catfiscal))
  end

  test "should show rba_catfiscal" do
    get :show, id: @rba_catfiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_catfiscal
    assert_response :success
  end

  test "should update rba_catfiscal" do
    patch :update, id: @rba_catfiscal, rba_catfiscal: { codigo: @rba_catfiscal.codigo, desc: @rba_catfiscal.desc, nombre: @rba_catfiscal.nombre }
    assert_redirected_to rba_catfiscal_path(assigns(:rba_catfiscal))
  end

  test "should destroy rba_catfiscal" do
    assert_difference('Rba::Catfiscal.count', -1) do
      delete :destroy, id: @rba_catfiscal
    end

    assert_redirected_to rba_catfiscales_path
  end
end
