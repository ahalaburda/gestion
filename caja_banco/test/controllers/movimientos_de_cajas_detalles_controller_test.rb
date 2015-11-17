require 'test_helper'

class MovimientosDeCajasDetallesControllerTest < ActionController::TestCase
  setup do
    @movimiento_de_caja_detalle = movimientos_de_cajas_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_cajas_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_de_caja_detalle" do
    assert_difference('MovimientoDeCajaDetalle.count') do
      post :create, movimiento_de_caja_detalle: { cheque_entrante_id: @movimiento_de_caja_detalle.cheque_entrante_id, cheque_propio_id: @movimiento_de_caja_detalle.cheque_propio_id, descripcion: @movimiento_de_caja_detalle.descripcion, monto_cheque: @movimiento_de_caja_detalle.monto_cheque, monto_efectivo: @movimiento_de_caja_detalle.monto_efectivo, movimiento_de_caja_id: @movimiento_de_caja_detalle.movimiento_de_caja_id }
    end

    assert_redirected_to movimiento_de_caja_detalle_path(assigns(:movimiento_de_caja_detalle))
  end

  test "should show movimiento_de_caja_detalle" do
    get :show, id: @movimiento_de_caja_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_de_caja_detalle
    assert_response :success
  end

  test "should update movimiento_de_caja_detalle" do
    patch :update, id: @movimiento_de_caja_detalle, movimiento_de_caja_detalle: { cheque_entrante_id: @movimiento_de_caja_detalle.cheque_entrante_id, cheque_propio_id: @movimiento_de_caja_detalle.cheque_propio_id, descripcion: @movimiento_de_caja_detalle.descripcion, monto_cheque: @movimiento_de_caja_detalle.monto_cheque, monto_efectivo: @movimiento_de_caja_detalle.monto_efectivo, movimiento_de_caja_id: @movimiento_de_caja_detalle.movimiento_de_caja_id }
    assert_redirected_to movimiento_de_caja_detalle_path(assigns(:movimiento_de_caja_detalle))
  end

  test "should destroy movimiento_de_caja_detalle" do
    assert_difference('MovimientoDeCajaDetalle.count', -1) do
      delete :destroy, id: @movimiento_de_caja_detalle
    end

    assert_redirected_to movimientos_de_cajas_detalles_path
  end
end
