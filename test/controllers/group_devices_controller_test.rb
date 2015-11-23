require 'test_helper'

class GroupDevicesControllerTest < ActionController::TestCase
  setup do
    d1 = devices(:one)
    d2 = devices(:two)
    @group = groups(:one)
    @group.devices << d1
    @group.devices << d2
  end

  test "should get index" do
    get :index, format: :json, group_id: @group.id
    assert_response :success
    devices = JSON.parse(@response.body)
    devices.each do |device|
      assert_not_nil device['id']
      assert_not_nil device['serial']
      assert_not_nil device['capability']
      assert_not_nil device['url']
    end
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get remove" do
  #   get :remove
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
