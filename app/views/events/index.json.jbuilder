json.array!(@events) do |event|
  json.extract! event, :id, :title :event_on
  json.url event_url(event, format: :json)
end
