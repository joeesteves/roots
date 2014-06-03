require 'test_helper'

class Rba::EmpresagruposControllerTest < ActionController::TestCase
  setup do
    @rba_empresagrupo = rba_empresagrupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_empresagrupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_empresagrupo" do
    assert_difference('Rba::Empresagrupo.count') do
      post :create, rba_empresagrupo: { codigo: @rba_empresagrupo.codigo, desc: @rba_empresagrupo.desc, nombre: @rba_empresagrupo.nombre }
    end

    assert_redirected_to rba_empresagrupo_path(assigns(:rba_empresagrupo))
  end

  test "should show rba_empresagrupo" do
    get :show, id: @rba_empresagrupo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_empresagrupo
    assert_response :success
  end

  test "should update rba_empresagrupo" do
    patch :update, id: @rba_empresagrupo, rba_empresagrupo: { codigo: @rba_empresagrupo.codigo, desc: @rba_empresagrupo.desc, nombre: @rba_empresagrupo.nombre }
    assert_redirected_to rba_empresagrupo_path(assigns(:rba_empresagrupo))
  end

  test "should destroy rba_empresagrupo" do
    assert_difference('Rba::Empresagrupo.count', -1) do
      delete :destroy, id: @rba_empresagrupo
    end

    assert_redirected_to rba_empresagrupos_path
  end
end
