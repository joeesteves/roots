require 'test_helper'

class Rga::RegistrosControllerTest < ActionController::TestCase
  setup do
    @rga_registro = rga_registros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_registros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_registro" do
    assert_difference('Rga::Registro.count') do
      post :create, rga_registro: { cantidad: @rga_registro.cantidad, desc: @rga_registro.desc, destcategoria_id: @rga_registro.destcategoria_id, destestado_id: @rga_registro.destestado_id, destrodeo_id: @rga_registro.destrodeo_id, empresa_id: @rga_registro.empresa_id, establecimiento_id: @rga_registro.establecimiento_id, evento_id: @rga_registro.evento_id, fecha: @rga_registro.fecha, origcategoria_id: @rga_registro.origcategoria_id, origestado_id: @rga_registro.origestado_id, origrodeo_id: @rga_registro.origrodeo_id, peso: @rga_registro.peso }
    end

    assert_redirected_to rga_registro_path(assigns(:rga_registro))
  end

  test "should show rga_registro" do
    get :show, id: @rga_registro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_registro
    assert_response :success
  end

  test "should update rga_registro" do
    patch :update, id: @rga_registro, rga_registro: { cantidad: @rga_registro.cantidad, desc: @rga_registro.desc, destcategoria_id: @rga_registro.destcategoria_id, destestado_id: @rga_registro.destestado_id, destrodeo_id: @rga_registro.destrodeo_id, empresa_id: @rga_registro.empresa_id, establecimiento_id: @rga_registro.establecimiento_id, evento_id: @rga_registro.evento_id, fecha: @rga_registro.fecha, origcategoria_id: @rga_registro.origcategoria_id, origestado_id: @rga_registro.origestado_id, origrodeo_id: @rga_registro.origrodeo_id, peso: @rga_registro.peso }
    assert_redirected_to rga_registro_path(assigns(:rga_registro))
  end

  test "should destroy rga_registro" do
    assert_difference('Rga::Registro.count', -1) do
      delete :destroy, id: @rga_registro
    end

    assert_redirected_to rga_registros_path
  end
end
