json.array!(@pictures) do |picture|
  json.extract! picture, :id, :user_id, :name
  json.url picture_url(picture, format: :json)
end
