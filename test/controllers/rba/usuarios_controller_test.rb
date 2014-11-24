require 'test_helper'

class Rba::UsuariosControllerTest < ActionController::TestCase
  setup do
    @rb_usuario = rb_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rb_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rb_usuario" do
    assert_difference('Rb::Usuario.count') do
      post :create, rb_usuario: { apellido: @rb_usuario.apellido, mail: @rb_usuario.mail, nombre: @rb_usuario.nombre, password_digest: @rb_usuario.password_digest, usuario: @rb_usuario.usuario }
    end

    assert_redirected_to rb_usuario_path(assigns(:rb_usuario))
  end

  test "should show rb_usuario" do
    get :show, id: @rb_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rb_usuario
    assert_response :success
  end

  test "should update rb_usuario" do
    patch :update, id: @rb_usuario, rb_usuario: { apellido: @rb_usuario.apellido, mail: @rb_usuario.mail, nombre: @rb_usuario.nombre, password_digest: @rb_usuario.password_digest, usuario: @rb_usuario.usuario }
    assert_redirected_to rb_usuario_path(assigns(:rb_usuario))
  end

  test "should destroy rb_usuario" do
    assert_difference('Rb::Usuario.count', -1) do
      delete :destroy, id: @rb_usuario
    end

    assert_redirected_to rb_usuarios_path
  end
end
