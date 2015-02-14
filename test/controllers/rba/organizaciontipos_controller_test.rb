require 'test_helper'

class Rba::OrganizaciontiposControllerTest < ActionController::TestCase
  setup do
    @rba_organizaciontipo = rba_organizaciontipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rba_organizaciontipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rba_organizaciontipo" do
    assert_difference('Rba::Organizaciontipo.count') do
      post :create, rba_organizaciontipo: { estado: @rba_organizaciontipo.estado, nombre: @rba_organizaciontipo.nombre }
    end

    assert_redirected_to rba_organizaciontipo_path(assigns(:rba_organizaciontipo))
  end

  test "should show rba_organizaciontipo" do
    get :show, id: @rba_organizaciontipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rba_organizaciontipo
    assert_response :success
  end

  test "should update rba_organizaciontipo" do
    patch :update, id: @rba_organizaciontipo, rba_organizaciontipo: { estado: @rba_organizaciontipo.estado, nombre: @rba_organizaciontipo.nombre }
    assert_redirected_to rba_organizaciontipo_path(assigns(:rba_organizaciontipo))
  end

  test "should destroy rba_organizaciontipo" do
    assert_difference('Rba::Organizaciontipo.count', -1) do
      delete :destroy, id: @rba_organizaciontipo
    end

    assert_redirected_to rba_organizaciontipos_path
  end
end
