require 'test_helper'

class FooControllerTest < ActionController::TestCase
  test "should throw a timeout exception" do
    Rack::Timeout.timeout  = 2
    get :bar, {:sleep => 3}
    assert_response :error
    assert @response.body == 'Error: The request timed out.'
  end
  test "show NOT throw a timeout exception" do
    Rack::Timeout.timeout  = 2
    get :bar, {:sleep => 0}
    assert_response :success
    assert @response.body == 'hello'
  end
end
