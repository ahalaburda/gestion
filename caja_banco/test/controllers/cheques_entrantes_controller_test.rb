require 'test_helper'

class ChequesEntrantesControllerTest < ActionController::TestCase
  setup do
    @cheque_entrante = cheques_entrantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheques_entrantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheque_entrante" do
    assert_difference('ChequeEntrante.count') do
      post :create, cheque_entrante: { banco_id: @cheque_entrante.banco_id, concepto: @cheque_entrante.concepto, fecha: @cheque_entrante.fecha, monto: @cheque_entrante.monto, numero: @cheque_entrante.numero, persona_id: @cheque_entrante.persona_id }
    end

    assert_redirected_to cheque_entrante_path(assigns(:cheque_entrante))
  end

  test "should show cheque_entrante" do
    get :show, id: @cheque_entrante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheque_entrante
    assert_response :success
  end

  test "should update cheque_entrante" do
    patch :update, id: @cheque_entrante, cheque_entrante: { banco_id: @cheque_entrante.banco_id, concepto: @cheque_entrante.concepto, fecha: @cheque_entrante.fecha, monto: @cheque_entrante.monto, numero: @cheque_entrante.numero, persona_id: @cheque_entrante.persona_id }
    assert_redirected_to cheque_entrante_path(assigns(:cheque_entrante))
  end

  test "should destroy cheque_entrante" do
    assert_difference('ChequeEntrante.count', -1) do
      delete :destroy, id: @cheque_entrante
    end

    assert_redirected_to cheques_entrantes_path
  end
end
