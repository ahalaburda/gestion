require 'test_helper'

class TiposDeMovimientosControllerTest < ActionController::TestCase
  setup do
    @tipo_de_movimiento = tipos_de_movimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_de_movimiento" do
    assert_difference('TipoDeMovimiento.count') do
      post :create, tipo_de_movimiento: { descripcion: @tipo_de_movimiento.descripcion }
    end

    assert_redirected_to tipo_de_movimiento_path(assigns(:tipo_de_movimiento))
  end

  test "should show tipo_de_movimiento" do
    get :show, id: @tipo_de_movimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_de_movimiento
    assert_response :success
  end

  test "should update tipo_de_movimiento" do
    patch :update, id: @tipo_de_movimiento, tipo_de_movimiento: { descripcion: @tipo_de_movimiento.descripcion }
    assert_redirected_to tipo_de_movimiento_path(assigns(:tipo_de_movimiento))
  end

  test "should destroy tipo_de_movimiento" do
    assert_difference('TipoDeMovimiento.count', -1) do
      delete :destroy, id: @tipo_de_movimiento
    end

    assert_redirected_to tipos_de_movimientos_path
  end
end
