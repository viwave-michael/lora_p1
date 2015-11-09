json.array!(@help_call_answers) do |help_call_answer|
  json.extract! help_call_answer, :id, :device_id, :help_call_id, :when, :lng, :lat
  json.url help_call_answer_url(help_call_answer, format: :json)
end
