json.array!(@positions) do |position|
  json.extract! position, :id, :device_id, :when, :lng, :lat
  json.url position_url(position, format: :json)
end
