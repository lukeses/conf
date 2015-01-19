json.array!(@events) do |event|
  json.extract! event, :id, :start_date, :kind, :type, :description
  json.url event_url(event, format: :json)
end
