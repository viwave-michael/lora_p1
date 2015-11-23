require 'test_helper'

class RollCallsControllerTest < ActionController::TestCase
  setup do
    @roll_call = roll_calls(:one)
    @device = devices(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:roll_calls)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create roll_call" do
    assert_difference('RollCall.count') do
      post :create, format: :json,
        roll_call: { lat: @roll_call.lat, lng: @roll_call.lng, manual: @roll_call.manual, when: @roll_call.when },
        device_id: @device.id
    end
    assert_response :success

    roll_call = JSON.parse(@response.body)
    assert_not_nil roll_call['id']
    assert_not_nil roll_call['device_id']
    assert_not_nil roll_call['lat']
    assert_not_nil roll_call['lng']
    assert_not_nil roll_call['manual']
    assert_not_nil roll_call['when']
  end

  # test "should show roll_call" do
  #   get :show, id: @roll_call
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @roll_call
  #   assert_response :success
  # end

  # test "should update roll_call" do
  #   patch :update, id: @roll_call, roll_call: { device_id: @roll_call.device_id, lat: @roll_call.lat, lng: @roll_call.lng, manual: @roll_call.manual, when: @roll_call.when }
  #   assert_redirected_to roll_call_path(assigns(:roll_call))
  # end

  # test "should destroy roll_call" do
  #   assert_difference('RollCall.count', -1) do
  #     delete :destroy, id: @roll_call
  #   end

  #   assert_redirected_to roll_calls_path
  # end
end
