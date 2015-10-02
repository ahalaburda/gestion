require 'test_helper'

class TiposDePersonasControllerTest < ActionController::TestCase
  setup do
    @tipo_de_persona = tipos_de_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_de_persona" do
    assert_difference('TipoDePersona.count') do
      post :create, tipo_de_persona: { descripcion: @tipo_de_persona.descripcion }
    end

    assert_redirected_to tipo_de_persona_path(assigns(:tipo_de_persona))
  end

  test "should show tipo_de_persona" do
    get :show, id: @tipo_de_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_de_persona
    assert_response :success
  end

  test "should update tipo_de_persona" do
    patch :update, id: @tipo_de_persona, tipo_de_persona: { descripcion: @tipo_de_persona.descripcion }
    assert_redirected_to tipo_de_persona_path(assigns(:tipo_de_persona))
  end

  test "should destroy tipo_de_persona" do
    assert_difference('TipoDePersona.count', -1) do
      delete :destroy, id: @tipo_de_persona
    end

    assert_redirected_to tipos_de_personas_path
  end
end
