require 'test_helper'

class ChequerasControllerTest < ActionController::TestCase
  setup do
    @chequera = chequeras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chequeras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chequera" do
    assert_difference('Chequera.count') do
      post :create, chequera: { cuenta_bancaria_id: @chequera.cuenta_bancaria_id }
    end

    assert_redirected_to chequera_path(assigns(:chequera))
  end

  test "should show chequera" do
    get :show, id: @chequera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chequera
    assert_response :success
  end

  test "should update chequera" do
    patch :update, id: @chequera, chequera: { cuenta_bancaria_id: @chequera.cuenta_bancaria_id }
    assert_redirected_to chequera_path(assigns(:chequera))
  end

  test "should destroy chequera" do
    assert_difference('Chequera.count', -1) do
      delete :destroy, id: @chequera
    end

    assert_redirected_to chequeras_path
  end
end
