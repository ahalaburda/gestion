require 'test_helper'

class LibrosDeCajasControllerTest < ActionController::TestCase
  test "should get libro_de_caja" do
    get :libro_de_caja
    assert_response :success
  end

end
