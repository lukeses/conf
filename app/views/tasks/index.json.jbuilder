json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :end_date, :reminder, :sponsor_id, :organiser_id, :speaker_id
  json.url task_url(task, format: :json)
end
