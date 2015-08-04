require 'test_helper'

class TripmapsControllerTest < ActionController::TestCase
  test "should get trips" do
    get :trips
    assert_response :success
  end

  test "should get fish" do
    get :fish
    assert_response :success
  end

  test "should get pictures" do
    get :pictures
    assert_response :success
  end

end
