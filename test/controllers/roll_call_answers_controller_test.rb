require 'test_helper'

class RollCallAnswersControllerTest < ActionController::TestCase
  setup do
    @roll_call_answer = roll_call_answers(:one)
    @roll_call = roll_calls(:one)
    @device = devices(:one)
  end

# test "should create roll_call" do
#   assert_difference('RollCall.count') do
#     post :create, roll_call: { device_id: @roll_call.device_id, lat: @roll_call.lat, lng: @roll_call.lng, manual: @roll_call.manual, when: @roll_call.when }
#   end

#   assert_redirected_to roll_call_path(assigns(:roll_call))
# end

  test "should create roll_call_answer" do
    assert_difference('RollCallAnswer.count') do
      post :create, format: :json,
        roll_call_answer: { roll_call_id: @roll_call.id, lat: @roll_call_answer.lat, lng: @roll_call_answer.lng, when: @roll_call_answer.when },
        device_id: @device.id
    end
    assert_response :success

    answer = JSON.parse(@response.body)
    assert_not_nil answer['id']
    assert_not_nil answer['device_id']
    assert_not_nil answer['roll_call_id']
    assert_not_nil answer['lat']
    assert_not_nil answer['lng']
    assert_not_nil answer['when']
  end

  # test "should show roll_call_answer" do
  #   get :show, id: @roll_call_answer
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @roll_call_answer
  #   assert_response :success
  # end

  # test "should update roll_call_answer" do
  #   patch :update, id: @roll_call_answer, roll_call_answer: { device_id: @roll_call_answer.device_id, lat: @roll_call_answer.lat, lng: @roll_call_answer.lng, roll_call_id: @roll_call_answer.roll_call_id, when: @roll_call_answer.when }
  #   assert_redirected_to roll_call_answer_path(assigns(:roll_call_answer))
  # end

  # test "should destroy roll_call_answer" do
  #   assert_difference('RollCallAnswer.count', -1) do
  #     delete :destroy, id: @roll_call_answer
  #   end

  #   assert_redirected_to roll_call_answers_path
  # end
end
