require 'test_helper'

class MovimientosDeCajasControllerTest < ActionController::TestCase
  setup do
    @movimiento_de_caja = movimientos_de_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_de_caja" do
    assert_difference('MovimientoDeCaja.count') do
      post :create, movimiento_de_caja: { caja_id: @movimiento_de_caja.caja_id, descripcion: @movimiento_de_caja.descripcion, tipo_de_movimiento_id: @movimiento_de_caja.tipo_de_movimiento_id }
    end

    assert_redirected_to movimiento_de_caja_path(assigns(:movimiento_de_caja))
  end

  test "should show movimiento_de_caja" do
    get :show, id: @movimiento_de_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_de_caja
    assert_response :success
  end

  test "should update movimiento_de_caja" do
    patch :update, id: @movimiento_de_caja, movimiento_de_caja: { caja_id: @movimiento_de_caja.caja_id, descripcion: @movimiento_de_caja.descripcion, tipo_de_movimiento_id: @movimiento_de_caja.tipo_de_movimiento_id }
    assert_redirected_to movimiento_de_caja_path(assigns(:movimiento_de_caja))
  end

  test "should destroy movimiento_de_caja" do
    assert_difference('MovimientoDeCaja.count', -1) do
      delete :destroy, id: @movimiento_de_caja
    end

    assert_redirected_to movimientos_de_cajas_path
  end
end
