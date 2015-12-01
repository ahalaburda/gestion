require 'test_helper'

class LibrosDeBancosControllerTest < ActionController::TestCase
  test "should get libro_de_banco" do
    get :libro_de_banco
    assert_response :success
  end

end
