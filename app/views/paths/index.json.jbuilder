json.array!(@paths) do |path|
  json.extract! path, :id, :device_id
  json.url path_url(path, format: :json)
end
