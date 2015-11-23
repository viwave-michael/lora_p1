require 'test_helper'

class HelpCallAnswersControllerTest < ActionController::TestCase
  setup do
    @help_call_answer = help_call_answers(:one)
    @help_call = help_calls(:one)
    @device = devices(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:help_call_answers)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create help_call_answer" do
    assert_difference('HelpCallAnswer.count') do
      post :create, format: :json,
        help_call_answer: { help_call_id: @help_call.id, lat: @help_call_answer.lat, lng: @help_call_answer.lng, when: @help_call_answer.when },
        device_id: @device.id
    end
    assert_response :success

    answer = JSON.parse(@response.body)
    assert_not_nil answer['id']
    assert_not_nil answer['device_id']
    assert_not_nil answer['help_call_id']
    assert_not_nil answer['lat']
    assert_not_nil answer['lng']
    assert_not_nil answer['when']
  end

  # test "should show help_call_answer" do
  #   get :show, id: @help_call_answer
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @help_call_answer
  #   assert_response :success
  # end

  # test "should update help_call_answer" do
  #   patch :update, id: @help_call_answer, help_call_answer: { device_id: @help_call_answer.device_id, help_call_id: @help_call_answer.help_call_id, lat: @help_call_answer.lat, lng: @help_call_answer.lng, when: @help_call_answer.when }
  #   assert_redirected_to help_call_answer_path(assigns(:help_call_answer))
  # end

  # test "should destroy help_call_answer" do
  #   assert_difference('HelpCallAnswer.count', -1) do
  #     delete :destroy, id: @help_call_answer
  #   end

  #   assert_redirected_to help_call_answers_path
  # end
end
