require 'test_helper'

class MovimientosDeBancosControllerTest < ActionController::TestCase
  setup do
    @movimiento_de_banco = movimientos_de_bancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_bancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_de_banco" do
    assert_difference('MovimientoDeBanco.count') do
      post :create, movimiento_de_banco: { banco_id: @movimiento_de_banco.banco_id, descripcion: @movimiento_de_banco.descripcion, tipo_de_movimiento_id: @movimiento_de_banco.tipo_de_movimiento_id }
    end

    assert_redirected_to movimiento_de_banco_path(assigns(:movimiento_de_banco))
  end

  test "should show movimiento_de_banco" do
    get :show, id: @movimiento_de_banco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_de_banco
    assert_response :success
  end

  test "should update movimiento_de_banco" do
    patch :update, id: @movimiento_de_banco, movimiento_de_banco: { banco_id: @movimiento_de_banco.banco_id, descripcion: @movimiento_de_banco.descripcion, tipo_de_movimiento_id: @movimiento_de_banco.tipo_de_movimiento_id }
    assert_redirected_to movimiento_de_banco_path(assigns(:movimiento_de_banco))
  end

  test "should destroy movimiento_de_banco" do
    assert_difference('MovimientoDeBanco.count', -1) do
      delete :destroy, id: @movimiento_de_banco
    end

    assert_redirected_to movimientos_de_bancos_path
  end
end
