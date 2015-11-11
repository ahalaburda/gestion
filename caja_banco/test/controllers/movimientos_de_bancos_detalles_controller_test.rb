require 'test_helper'

class MovimientosDeBancosDetallesControllerTest < ActionController::TestCase
  setup do
    @movimiento_de_banco_detalle = movimientos_de_bancos_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_bancos_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_de_banco_detalle" do
    assert_difference('MovimientoDeBancoDetalle.count') do
      post :create, movimiento_de_banco_detalle: { cuenta_bancaria_id: @movimiento_de_banco_detalle.cuenta_bancaria_id, descripcion: @movimiento_de_banco_detalle.descripcion, monto: @movimiento_de_banco_detalle.monto, movimiento_de_banco_id: @movimiento_de_banco_detalle.movimiento_de_banco_id }
    end

    assert_redirected_to movimiento_de_banco_detalle_path(assigns(:movimiento_de_banco_detalle))
  end

  test "should show movimiento_de_banco_detalle" do
    get :show, id: @movimiento_de_banco_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_de_banco_detalle
    assert_response :success
  end

  test "should update movimiento_de_banco_detalle" do
    patch :update, id: @movimiento_de_banco_detalle, movimiento_de_banco_detalle: { cuenta_bancaria_id: @movimiento_de_banco_detalle.cuenta_bancaria_id, descripcion: @movimiento_de_banco_detalle.descripcion, monto: @movimiento_de_banco_detalle.monto, movimiento_de_banco_id: @movimiento_de_banco_detalle.movimiento_de_banco_id }
    assert_redirected_to movimiento_de_banco_detalle_path(assigns(:movimiento_de_banco_detalle))
  end

  test "should destroy movimiento_de_banco_detalle" do
    assert_difference('MovimientoDeBancoDetalle.count', -1) do
      delete :destroy, id: @movimiento_de_banco_detalle
    end

    assert_redirected_to movimientos_de_bancos_detalles_path
  end
end
