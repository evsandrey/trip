json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :name, :url, :description
  json.url manufacturer_url(manufacturer, format: :json)
end
