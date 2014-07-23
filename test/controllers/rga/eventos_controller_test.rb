require 'test_helper'

class Rga::EventosControllerTest < ActionController::TestCase
  setup do
    @rga_evento = rga_eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_evento" do
    assert_difference('Rga::Evento.count') do
      post :create, rga_evento: { codigo: @rga_evento.codigo, desc: @rga_evento.desc, estado: @rga_evento.estado, nombre: @rga_evento.nombre }
    end

    assert_redirected_to rga_evento_path(assigns(:rga_evento))
  end

  test "should show rga_evento" do
    get :show, id: @rga_evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_evento
    assert_response :success
  end

  test "should update rga_evento" do
    patch :update, id: @rga_evento, rga_evento: { codigo: @rga_evento.codigo, desc: @rga_evento.desc, estado: @rga_evento.estado, nombre: @rga_evento.nombre }
    assert_redirected_to rga_evento_path(assigns(:rga_evento))
  end

  test "should destroy rga_evento" do
    assert_difference('Rga::Evento.count', -1) do
      delete :destroy, id: @rga_evento
    end

    assert_redirected_to rga_eventos_path
  end
end
