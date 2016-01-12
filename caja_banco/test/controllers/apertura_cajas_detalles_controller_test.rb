require 'test_helper'

class AperturaCajasDetallesControllerTest < ActionController::TestCase
  setup do
    @apertura_cajas_detalle = apertura_cajas_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apertura_cajas_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apertura_cajas_detalle" do
    assert_difference('AperturaCajasDetalle.count') do
      post :create, apertura_cajas_detalle: { apertura_caja_id: @apertura_cajas_detalle.apertura_caja_id, cheque_entrante_id: @apertura_cajas_detalle.cheque_entrante_id, monto: @apertura_cajas_detalle.monto }
    end

    assert_redirected_to apertura_cajas_detalle_path(assigns(:apertura_cajas_detalle))
  end

  test "should show apertura_cajas_detalle" do
    get :show, id: @apertura_cajas_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apertura_cajas_detalle
    assert_response :success
  end

  test "should update apertura_cajas_detalle" do
    patch :update, id: @apertura_cajas_detalle, apertura_cajas_detalle: { apertura_caja_id: @apertura_cajas_detalle.apertura_caja_id, cheque_entrante_id: @apertura_cajas_detalle.cheque_entrante_id, monto: @apertura_cajas_detalle.monto }
    assert_redirected_to apertura_cajas_detalle_path(assigns(:apertura_cajas_detalle))
  end

  test "should destroy apertura_cajas_detalle" do
    assert_difference('AperturaCajasDetalle.count', -1) do
      delete :destroy, id: @apertura_cajas_detalle
    end

    assert_redirected_to apertura_cajas_detalles_path
  end
end
