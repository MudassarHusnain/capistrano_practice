json.extract! article, :id, :title, :String, :content, :text, :created_at, :updated_at
json.url article_url(article, format: :json)
