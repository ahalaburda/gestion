require 'test_helper'

class CuentasControllerTest < ActionController::TestCase
  setup do
    @cuenta = cuentas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuenta" do
    assert_difference('Cuenta.count') do
      post :create, cuenta: { descripcion: @cuenta.descripcion, numero_cuenta_contable: @cuenta.numero_cuenta_contable }
    end

    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  test "should show cuenta" do
    get :show, id: @cuenta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuenta
    assert_response :success
  end

  test "should update cuenta" do
    patch :update, id: @cuenta, cuenta: { descripcion: @cuenta.descripcion, numero_cuenta_contable: @cuenta.numero_cuenta_contable }
    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  test "should destroy cuenta" do
    assert_difference('Cuenta.count', -1) do
      delete :destroy, id: @cuenta
    end

    assert_redirected_to cuentas_path
  end
end
