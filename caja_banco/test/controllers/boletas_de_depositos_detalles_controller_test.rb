require 'test_helper'

class BoletasDeDepositosDetallesControllerTest < ActionController::TestCase
  setup do
    @boleta_de_deposito_detalle = boletas_de_depositos_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boletas_de_depositos_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boleta_de_deposito_detalle" do
    assert_difference('BoletaDeDepositoDetalle.count') do
      post :create, boleta_de_deposito_detalle: { boleta_de_deposito_id: @boleta_de_deposito_detalle.boleta_de_deposito_id, cheque_entrante_id: @boleta_de_deposito_detalle.cheque_entrante_id, monto_cheque: @boleta_de_deposito_detalle.monto_cheque, monto_efectivo: @boleta_de_deposito_detalle.monto_efectivo, total: @boleta_de_deposito_detalle.total }
    end

    assert_redirected_to boleta_de_deposito_detalle_path(assigns(:boleta_de_deposito_detalle))
  end

  test "should show boleta_de_deposito_detalle" do
    get :show, id: @boleta_de_deposito_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boleta_de_deposito_detalle
    assert_response :success
  end

  test "should update boleta_de_deposito_detalle" do
    patch :update, id: @boleta_de_deposito_detalle, boleta_de_deposito_detalle: { boleta_de_deposito_id: @boleta_de_deposito_detalle.boleta_de_deposito_id, cheque_entrante_id: @boleta_de_deposito_detalle.cheque_entrante_id, monto_cheque: @boleta_de_deposito_detalle.monto_cheque, monto_efectivo: @boleta_de_deposito_detalle.monto_efectivo, total: @boleta_de_deposito_detalle.total }
    assert_redirected_to boleta_de_deposito_detalle_path(assigns(:boleta_de_deposito_detalle))
  end

  test "should destroy boleta_de_deposito_detalle" do
    assert_difference('BoletaDeDepositoDetalle.count', -1) do
      delete :destroy, id: @boleta_de_deposito_detalle
    end

    assert_redirected_to boletas_de_depositos_detalles_path
  end
end
