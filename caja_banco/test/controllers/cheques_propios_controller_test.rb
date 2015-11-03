require 'test_helper'

class ChequesPropiosControllerTest < ActionController::TestCase
  setup do
    @cheque_propio = cheques_propios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheques_propios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheque_propio" do
    assert_difference('ChequePropio.count') do
      post :create, cheque_propio: { chequera_id: @cheque_propio.chequera_id, concepto: @cheque_propio.concepto, fecha: @cheque_propio.fecha, monto: @cheque_propio.monto, numero_cheque: @cheque_propio.numero_cheque }
    end

    assert_redirected_to cheque_propio_path(assigns(:cheque_propio))
  end

  test "should show cheque_propio" do
    get :show, id: @cheque_propio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheque_propio
    assert_response :success
  end

  test "should update cheque_propio" do
    patch :update, id: @cheque_propio, cheque_propio: { chequera_id: @cheque_propio.chequera_id, concepto: @cheque_propio.concepto, fecha: @cheque_propio.fecha, monto: @cheque_propio.monto, numero_cheque: @cheque_propio.numero_cheque }
    assert_redirected_to cheque_propio_path(assigns(:cheque_propio))
  end

  test "should destroy cheque_propio" do
    assert_difference('ChequePropio.count', -1) do
      delete :destroy, id: @cheque_propio
    end

    assert_redirected_to cheques_propios_path
  end
end
