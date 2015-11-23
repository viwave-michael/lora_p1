require 'test_helper'

class HelpCallsControllerTest < ActionController::TestCase
  setup do
    @help_call = help_calls(:one)
    @device = devices(:one)
  end

  test "should get index" do
    get :index, format: :json, device_id: @device.id
    assert_response :success
    assert_not_nil assigns(:help_calls)

    help_calls = JSON.parse(@response.body)
    help_calls.each do |help_call|
      assert_not_nil help_call['id']
      assert_not_nil help_call['device_id']
      assert_not_nil help_call['lat']
      assert_not_nil help_call['lng']
      assert_not_nil help_call['when']
      assert_not_nil help_call['url']
    end
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create help_call" do
    assert_difference('HelpCall.count') do
      post :create, format: :json,
        help_call: { lat: @help_call.lat, lng: @help_call.lng, when: @help_call.when },
        device_id: @device.id
    end
    assert_response :success

    help_call = JSON.parse(@response.body)
    assert_not_nil help_call['id']
    assert_not_nil help_call['device_id']
    assert_not_nil help_call['lat']
    assert_not_nil help_call['lng']
    assert_not_nil help_call['when']
  end

  # test "should show help_call" do
  #   get :show, id: @help_call
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @help_call
  #   assert_response :success
  # end

  # test "should update help_call" do
  #   patch :update, id: @help_call, help_call: { device_id: @help_call.device_id, lat: @help_call.lat, lng: @help_call.lng, when: @help_call.when }
  #   assert_redirected_to help_call_path(assigns(:help_call))
  # end

  # test "should destroy help_call" do
  #   assert_difference('HelpCall.count', -1) do
  #     delete :destroy, id: @help_call
  #   end

  #   assert_redirected_to help_calls_path
  # end
end
