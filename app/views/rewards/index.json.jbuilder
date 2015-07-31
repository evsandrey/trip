json.array!(@rewards) do |reward|
  json.extract! reward, :id, :user_id, :trip_id, :name, :description
  json.url reward_url(reward, format: :json)
end
