require 'test_helper'

class Rga::AnimalesControllerTest < ActionController::TestCase
  setup do
    @rga_animal = rga_animales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rga_animales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rga_animal" do
    assert_difference('Rga::Animal.count') do
      post :create, rga_animal: { alias: @rga_animal.alias, codigo: @rga_animal.codigo, color: @rga_animal.color, desc: @rga_animal.desc, estado: @rga_animal.estado, madre_id: @rga_animal.madre_id, nombre: @rga_animal.nombre, padre_id: @rga_animal.padre_id, rp: @rga_animal.rp }
    end

    assert_redirected_to rga_animal_path(assigns(:rga_animal))
  end

  test "should show rga_animal" do
    get :show, id: @rga_animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rga_animal
    assert_response :success
  end

  test "should update rga_animal" do
    patch :update, id: @rga_animal, rga_animal: { alias: @rga_animal.alias, codigo: @rga_animal.codigo, color: @rga_animal.color, desc: @rga_animal.desc, estado: @rga_animal.estado, madre_id: @rga_animal.madre_id, nombre: @rga_animal.nombre, padre_id: @rga_animal.padre_id, rp: @rga_animal.rp }
    assert_redirected_to rga_animal_path(assigns(:rga_animal))
  end

  test "should destroy rga_animal" do
    assert_difference('Rga::Animal.count', -1) do
      delete :destroy, id: @rga_animal
    end

    assert_redirected_to rga_animales_path
  end
end
