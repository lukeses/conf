json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :surname, :email, :skype, :is_paid, :is_guest, :description, :event_id
  json.url participant_url(participant, format: :json)
end
