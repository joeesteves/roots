require 'test_helper'

class Rba::EmpresasControllerTest < ActionController::TestCase
  setup do
    @rba_empresa = rba_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_empresa" do
    assert_difference('Rba::Empresa.count') do
      post :create, rba_empresa: { catfiscal_id: @rba_empresa.catfiscal_id, codigo: @rba_empresa.codigo, cuit: @rba_empresa.cuit, empresagrupo_id: @rba_empresa.empresagrupo_id, nombre: @rba_empresa.nombre }
    end

    assert_redirected_to rba_empresa_path(assigns(:rba_empresa))
  end

  test "should show rba_empresa" do
    get :show, id: @rba_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_empresa
    assert_response :success
  end

  test "should update rba_empresa" do
    patch :update, id: @rba_empresa, rba_empresa: { catfiscal_id: @rba_empresa.catfiscal_id, codigo: @rba_empresa.codigo, cuit: @rba_empresa.cuit, empresagrupo_id: @rba_empresa.empresagrupo_id, nombre: @rba_empresa.nombre }
    assert_redirected_to rba_empresa_path(assigns(:rba_empresa))
  end

  test "should destroy rba_empresa" do
    assert_difference('Rba::Empresa.count', -1) do
      delete :destroy, id: @rba_empresa
    end

    assert_redirected_to rba_empresas_path
  end
end
