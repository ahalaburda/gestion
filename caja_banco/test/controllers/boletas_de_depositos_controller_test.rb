require 'test_helper'

class BoletasDeDepositosControllerTest < ActionController::TestCase
  setup do
    @boleta_de_deposito = boletas_de_depositos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boletas_de_depositos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boleta_de_deposito" do
    assert_difference('BoletaDeDeposito.count') do
      post :create, boleta_de_deposito: { banco_id: @boleta_de_deposito.banco_id, caja_id: @boleta_de_deposito.caja_id, cuenta_bancaria_id: @boleta_de_deposito.cuenta_bancaria_id, fecha: @boleta_de_deposito.fecha, persona_id: @boleta_de_deposito.persona_id }
    end

    assert_redirected_to boleta_de_deposito_path(assigns(:boleta_de_deposito))
  end

  test "should show boleta_de_deposito" do
    get :show, id: @boleta_de_deposito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boleta_de_deposito
    assert_response :success
  end

  test "should update boleta_de_deposito" do
    patch :update, id: @boleta_de_deposito, boleta_de_deposito: { banco_id: @boleta_de_deposito.banco_id, caja_id: @boleta_de_deposito.caja_id, cuenta_bancaria_id: @boleta_de_deposito.cuenta_bancaria_id, fecha: @boleta_de_deposito.fecha, persona_id: @boleta_de_deposito.persona_id }
    assert_redirected_to boleta_de_deposito_path(assigns(:boleta_de_deposito))
  end

  test "should destroy boleta_de_deposito" do
    assert_difference('BoletaDeDeposito.count', -1) do
      delete :destroy, id: @boleta_de_deposito
    end

    assert_redirected_to boletas_de_depositos_path
  end
end
