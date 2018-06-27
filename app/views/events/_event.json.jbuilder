json.extract! event, :id, :name, :count, :created_at, :updated_at
json.url event_url(event, format: :json)
