require 'test_helper'

class Rga::EstadosEventosControllerTest < ActionController::TestCase
  setup do
    @rga_estados_evento = rga_estados_eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_estados_eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_estados_evento" do
    assert_difference('Rga::EstadosEvento.count') do
      post :create, rga_estados_evento: { codigo: @rga_estados_evento.codigo, estado_id: @rga_estados_evento.estado_id, evento_id: @rga_estados_evento.evento_id }
    end

    assert_redirected_to rga_estados_evento_path(assigns(:rga_estados_evento))
  end

  test "should show rga_estados_evento" do
    get :show, id: @rga_estados_evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_estados_evento
    assert_response :success
  end

  test "should update rga_estados_evento" do
    patch :update, id: @rga_estados_evento, rga_estados_evento: { codigo: @rga_estados_evento.codigo, estado_id: @rga_estados_evento.estado_id, evento_id: @rga_estados_evento.evento_id }
    assert_redirected_to rga_estados_evento_path(assigns(:rga_estados_evento))
  end

  test "should destroy rga_estados_evento" do
    assert_difference('Rga::EstadosEvento.count', -1) do
      delete :destroy, id: @rga_estados_evento
    end

    assert_redirected_to rga_estados_eventos_path
  end
end
