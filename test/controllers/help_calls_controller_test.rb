require 'test_helper'

class HelpCallsControllerTest < ActionController::TestCase
  setup do
    @help_call = help_calls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:help_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create help_call" do
    assert_difference('HelpCall.count') do
      post :create, help_call: { device_id: @help_call.device_id, lat: @help_call.lat, lng: @help_call.lng, when: @help_call.when }
    end

    assert_redirected_to help_call_path(assigns(:help_call))
  end

  test "should show help_call" do
    get :show, id: @help_call
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @help_call
    assert_response :success
  end

  test "should update help_call" do
    patch :update, id: @help_call, help_call: { device_id: @help_call.device_id, lat: @help_call.lat, lng: @help_call.lng, when: @help_call.when }
    assert_redirected_to help_call_path(assigns(:help_call))
  end

  test "should destroy help_call" do
    assert_difference('HelpCall.count', -1) do
      delete :destroy, id: @help_call
    end

    assert_redirected_to help_calls_path
  end
end
