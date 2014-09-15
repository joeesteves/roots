require 'test_helper'

class Rad::OperacionesControllerTest < ActionController::TestCase
  setup do
    @rad_operacion = rad_operaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rad_operaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rad_operacion" do
    assert_difference('Rad::Operacion.count') do
      post :create, rad_operacion: { ctaD_id: @rad_operacion.ctaD_id, ctaH_id: @rad_operacion.ctaH_id, cuotas: @rad_operacion.cuotas, desc: @rad_operacion.desc, fecha: @rad_operacion.fecha, importe: @rad_operacion.importe, operaciontipo_id: @rad_operacion.operaciontipo_id, rba/empresa_id: @rad_operacion.rba/empresa_id }
    end

    assert_redirected_to rad_operacion_path(assigns(:rad_operacion))
  end

  test "should show rad_operacion" do
    get :show, id: @rad_operacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rad_operacion
    assert_response :success
  end

  test "should update rad_operacion" do
    patch :update, id: @rad_operacion, rad_operacion: { ctaD_id: @rad_operacion.ctaD_id, ctaH_id: @rad_operacion.ctaH_id, cuotas: @rad_operacion.cuotas, desc: @rad_operacion.desc, fecha: @rad_operacion.fecha, importe: @rad_operacion.importe, operaciontipo_id: @rad_operacion.operaciontipo_id, rba/empresa_id: @rad_operacion.rba/empresa_id }
    assert_redirected_to rad_operacion_path(assigns(:rad_operacion))
  end

  test "should destroy rad_operacion" do
    assert_difference('Rad::Operacion.count', -1) do
      delete :destroy, id: @rad_operacion
    end

    assert_redirected_to rad_operaciones_path
  end
end
