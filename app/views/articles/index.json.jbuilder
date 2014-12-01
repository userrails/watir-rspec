json.array!(@articles) do |article|
  json.extract! article, :id, :name, :address
  json.url article_url(article, format: :json)
end
