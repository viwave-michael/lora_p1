require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  setup do
    @position = positions(:one)
    @device = devices(:one)
  end

  test "should get index" do
    get :index, format: :json, device_id: @device.id
    assert_response :success
    assert_not_nil assigns(:positions)

    positions = JSON.parse(@response.body)
    positions.each do |position|
      assert_not_nil position['id']
      assert_not_nil position['device_id']
      assert_not_nil position['lat']
      assert_not_nil position['lng']
      assert_not_nil position['when']
      assert_not_nil position['url']
    end
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create position" do
    assert_difference('Position.count') do
      post :create, format: :json,
        position: { device_id: @device.id, lat: @position.lat, lng: @position.lng, when: @position.when },
        device_id: @device.id
    end
    assert_response :success

    position = JSON.parse(@response.body)
    assert_not_nil position['id']
    assert_not_nil position['device_id']
    assert_not_nil position['lat']
    assert_not_nil position['lng']
    assert_not_nil position['when']
  end

  # test "should show position" do
  #   get :show, id: @position
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @position
  #   assert_response :success
  # end

  # test "should update position" do
  #   patch :update, id: @position, position: { lat: @position.lat, lng: @position.lng, when: @position.when }
  #   assert_redirected_to position_path(assigns(:position))
  # end

  # test "should destroy position" do
  #   assert_difference('Position.count', -1) do
  #     delete :destroy, id: @position
  #   end

  #   assert_redirected_to positions_path
  # end
end
