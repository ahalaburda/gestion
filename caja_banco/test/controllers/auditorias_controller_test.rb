require 'test_helper'

class AuditoriasControllerTest < ActionController::TestCase
  setup do
    @auditoria = auditorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auditorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auditoria" do
    assert_difference('Auditoria.count') do
      post :create, auditoria: { nombre_tabla: @auditoria.nombre_tabla, nombre_usuario: @auditoria.nombre_usuario, operacion: @auditoria.operacion, valor_anterior: @auditoria.valor_anterior, valor_nuevo: @auditoria.valor_nuevo }
    end

    assert_redirected_to auditoria_path(assigns(:auditoria))
  end

  test "should show auditoria" do
    get :show, id: @auditoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auditoria
    assert_response :success
  end

  test "should update auditoria" do
    patch :update, id: @auditoria, auditoria: { nombre_tabla: @auditoria.nombre_tabla, nombre_usuario: @auditoria.nombre_usuario, operacion: @auditoria.operacion, valor_anterior: @auditoria.valor_anterior, valor_nuevo: @auditoria.valor_nuevo }
    assert_redirected_to auditoria_path(assigns(:auditoria))
  end

  test "should destroy auditoria" do
    assert_difference('Auditoria.count', -1) do
      delete :destroy, id: @auditoria
    end

    assert_redirected_to auditorias_path
  end
end
