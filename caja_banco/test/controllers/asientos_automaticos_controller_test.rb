require 'test_helper'

class AsientosAutomaticosControllerTest < ActionController::TestCase
  setup do
    @asiento_automatico = asientos_automaticos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asientos_automaticos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asiento_automatico" do
    assert_difference('AsientoAutomatico.count') do
      post :create, asiento_automatico: { descripcion: @asiento_automatico.descripcion, fecha: @asiento_automatico.fecha, tipo_de_asiento: @asiento_automatico.tipo_de_asiento }
    end

    assert_redirected_to asiento_automatico_path(assigns(:asiento_automatico))
  end

  test "should show asiento_automatico" do
    get :show, id: @asiento_automatico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asiento_automatico
    assert_response :success
  end

  test "should update asiento_automatico" do
    patch :update, id: @asiento_automatico, asiento_automatico: { descripcion: @asiento_automatico.descripcion, fecha: @asiento_automatico.fecha, tipo_de_asiento: @asiento_automatico.tipo_de_asiento }
    assert_redirected_to asiento_automatico_path(assigns(:asiento_automatico))
  end

  test "should destroy asiento_automatico" do
    assert_difference('AsientoAutomatico.count', -1) do
      delete :destroy, id: @asiento_automatico
    end

    assert_redirected_to asientos_automaticos_path
  end
end
