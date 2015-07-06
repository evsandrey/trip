json.array!(@trophies) do |trophy|
  json.extract! trophy, :id, :fish_id, :trip_id, :weight
  json.url trophy_url(trophy, format: :json)
end
