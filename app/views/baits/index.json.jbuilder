json.array!(@baits) do |bait|
  json.extract! bait, :id, :name, :description
  json.url bait_url(bait, format: :json)
end
