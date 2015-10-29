require 'test_helper'

class CuentasBancariasControllerTest < ActionController::TestCase
  setup do
    @cuenta_bancaria = cuentas_bancarias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas_bancarias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuenta_bancaria" do
    assert_difference('CuentaBancaria.count') do
      post :create, cuenta_bancaria: { banco_id: @cuenta_bancaria.banco_id, estado_id: @cuenta_bancaria.estado_id, fecha_apertura: @cuenta_bancaria.fecha_apertura, numero_cuenta: @cuenta_bancaria.numero_cuenta, saldo: @cuenta_bancaria.saldo }
    end

    assert_redirected_to cuenta_bancaria_path(assigns(:cuenta_bancaria))
  end

  test "should show cuenta_bancaria" do
    get :show, id: @cuenta_bancaria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuenta_bancaria
    assert_response :success
  end

  test "should update cuenta_bancaria" do
    patch :update, id: @cuenta_bancaria, cuenta_bancaria: { banco_id: @cuenta_bancaria.banco_id, estado_id: @cuenta_bancaria.estado_id, fecha_apertura: @cuenta_bancaria.fecha_apertura, numero_cuenta: @cuenta_bancaria.numero_cuenta, saldo: @cuenta_bancaria.saldo }
    assert_redirected_to cuenta_bancaria_path(assigns(:cuenta_bancaria))
  end

  test "should destroy cuenta_bancaria" do
    assert_difference('CuentaBancaria.count', -1) do
      delete :destroy, id: @cuenta_bancaria
    end

    assert_redirected_to cuentas_bancarias_path
  end
end
