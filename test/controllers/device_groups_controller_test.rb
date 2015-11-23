require 'test_helper'

class DeviceGroupsControllerTest < ActionController::TestCase
  setup do
    g1 = groups(:one)
    g2 = groups(:two)
    @device = devices(:one)
    @device.groups << g1
    @device.groups << g2
  end

  test "should get index" do
    get :index, format: :json, device_id: @device.id
    assert_response :success
    groups = JSON.parse(@response.body)
    groups.each do |group|
      assert_not_nil group['id']
      assert_not_nil group['name']
      assert_not_nil group['description']
      assert_not_nil group['url']
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
