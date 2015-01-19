json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :form, :amount, :description, :event_id
  json.url sponsor_url(sponsor, format: :json)
end
