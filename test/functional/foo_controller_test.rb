require 'test_helper'

class FooControllerTest < ActionController::TestCase
  test "should throw a timeout exception" do
    Rack::Timeout.timeout  = 2
    get :bar, {:sleep => 5}
    assert_response :error
    assert @response.body == '{"type":"timeout_error","message":"The request timed out."}' 
  end
  test "show not throw a timeout exception" do
    Rack::Timeout.timeout  = 2
    get :bar, {:sleep => 0}
    assert_response :error
    assert @response.body == '{"type":"timeout_error","message":"The request timed out."}' 
  end
end
