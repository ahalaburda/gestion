require 'test_helper'

class AperturaCajasControllerTest < ActionController::TestCase
  setup do
    @apertura_caja = apertura_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apertura_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apertura_caja" do
    assert_difference('AperturaCaja.count') do
      post :create, apertura_caja: { apertura: @apertura_caja.apertura, caja_id: @apertura_caja.caja_id, cierre: @apertura_caja.cierre, persona_id: @apertura_caja.persona_id, saldo_final_cheque: @apertura_caja.saldo_final_cheque, saldo_final_efectivo: @apertura_caja.saldo_final_efectivo, saldo_inicial_cheque: @apertura_caja.saldo_inicial_cheque, saldo_inicial_efectivo: @apertura_caja.saldo_inicial_efectivo }
    end

    assert_redirected_to apertura_caja_path(assigns(:apertura_caja))
  end

  test "should show apertura_caja" do
    get :show, id: @apertura_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apertura_caja
    assert_response :success
  end

  test "should update apertura_caja" do
    patch :update, id: @apertura_caja, apertura_caja: { apertura: @apertura_caja.apertura, caja_id: @apertura_caja.caja_id, cierre: @apertura_caja.cierre, persona_id: @apertura_caja.persona_id, saldo_final_cheque: @apertura_caja.saldo_final_cheque, saldo_final_efectivo: @apertura_caja.saldo_final_efectivo, saldo_inicial_cheque: @apertura_caja.saldo_inicial_cheque, saldo_inicial_efectivo: @apertura_caja.saldo_inicial_efectivo }
    assert_redirected_to apertura_caja_path(assigns(:apertura_caja))
  end

  test "should destroy apertura_caja" do
    assert_difference('AperturaCaja.count', -1) do
      delete :destroy, id: @apertura_caja
    end

    assert_redirected_to apertura_cajas_path
  end
end
