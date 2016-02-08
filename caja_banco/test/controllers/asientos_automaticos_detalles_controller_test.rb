require 'test_helper'

class AsientosAutomaticosDetallesControllerTest < ActionController::TestCase
  setup do
    @asiento_automatico_detalle = asientos_automaticos_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asientos_automaticos_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asiento_automatico_detalle" do
    assert_difference('AsientoAutomaticoDetalle.count') do
      post :create, asiento_automatico_detalle: { asiento_automatico_id: @asiento_automatico_detalle.asiento_automatico_id, cuenta_id: @asiento_automatico_detalle.cuenta_id, monto_credito: @asiento_automatico_detalle.monto_credito, monto_debito: @asiento_automatico_detalle.monto_debito }
    end

    assert_redirected_to asiento_automatico_detalle_path(assigns(:asiento_automatico_detalle))
  end

  test "should show asiento_automatico_detalle" do
    get :show, id: @asiento_automatico_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asiento_automatico_detalle
    assert_response :success
  end

  test "should update asiento_automatico_detalle" do
    patch :update, id: @asiento_automatico_detalle, asiento_automatico_detalle: { asiento_automatico_id: @asiento_automatico_detalle.asiento_automatico_id, cuenta_id: @asiento_automatico_detalle.cuenta_id, monto_credito: @asiento_automatico_detalle.monto_credito, monto_debito: @asiento_automatico_detalle.monto_debito }
    assert_redirected_to asiento_automatico_detalle_path(assigns(:asiento_automatico_detalle))
  end

  test "should destroy asiento_automatico_detalle" do
    assert_difference('AsientoAutomaticoDetalle.count', -1) do
      delete :destroy, id: @asiento_automatico_detalle
    end

    assert_redirected_to asientos_automaticos_detalles_path
  end
end
