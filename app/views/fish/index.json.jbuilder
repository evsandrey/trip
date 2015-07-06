json.array!(@fish) do |fish|
  json.extract! fish, :id, :name, :description
  json.url fish_url(fish, format: :json)
end
