json.array!(@articles) do |article|
  json.extract! article, :id, :user_id, :name, :text
  json.url article_url(article, format: :json)
end
