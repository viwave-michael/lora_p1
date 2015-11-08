json.array!(@roll_calls) do |roll_call|
  json.extract! roll_call, :id, :device_id, :when, :lng, :lat, :manual
  json.url roll_call_url(roll_call, format: :json)
end
