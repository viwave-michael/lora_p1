json.array!(@roll_call_answers) do |roll_call_answer|
  json.extract! roll_call_answer, :id, :roll_call_id, :device_id, :when, :lng, :lat
  json.url roll_call_answer_url(roll_call_answer, format: :json)
end
