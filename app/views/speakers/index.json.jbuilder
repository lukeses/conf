json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :surname, :description, :event_id
  json.url speaker_url(speaker, format: :json)
end
