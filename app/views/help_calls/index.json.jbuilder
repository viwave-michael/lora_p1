json.array!(@help_calls) do |help_call|
  json.extract! help_call, :id, :device_id, :when, :lng, :lat
  json.url help_call_url(help_call, format: :json)
end
