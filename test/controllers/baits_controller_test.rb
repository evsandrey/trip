require 'test_helper'

class BaitsControllerTest < ActionController::TestCase
  setup do
    @bait = baits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bait" do
    assert_difference('Bait.count') do
      post :create, bait: { description: @bait.description, name: @bait.name }
    end

    assert_redirected_to bait_path(assigns(:bait))
  end

  test "should show bait" do
    get :show, id: @bait
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bait
    assert_response :success
  end

  test "should update bait" do
    patch :update, id: @bait, bait: { description: @bait.description, name: @bait.name }
    assert_redirected_to bait_path(assigns(:bait))
  end

  test "should destroy bait" do
    assert_difference('Bait.count', -1) do
      delete :destroy, id: @bait
    end

    assert_redirected_to baits_path
  end
end
