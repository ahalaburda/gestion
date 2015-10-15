require 'test_helper'

class CiudadesControllerTest < ActionController::TestCase
  setup do
    @ciudad = ciudades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ciudades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ciudad" do
    assert_difference('Ciudad.count') do
      post :create, ciudad: { codigo_postal: @ciudad.codigo_postal, departamento_id: @ciudad.departamento_id, descripcion: @ciudad.descripcion }
    end

    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  test "should show ciudad" do
    get :show, id: @ciudad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ciudad
    assert_response :success
  end

  test "should update ciudad" do
    patch :update, id: @ciudad, ciudad: { codigo_postal: @ciudad.codigo_postal, departamento_id: @ciudad.departamento_id, descripcion: @ciudad.descripcion }
    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  test "should destroy ciudad" do
    assert_difference('Ciudad.count', -1) do
      delete :destroy, id: @ciudad
    end

    assert_redirected_to ciudades_path
  end
end
