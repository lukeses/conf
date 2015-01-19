json.array!(@organisers) do |organiser|
  json.extract! organiser, :id, :name, :surname, :email, :skype, :description, :event_id
  json.url organiser_url(organiser, format: :json)
end
