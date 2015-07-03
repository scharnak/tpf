json.array!(@volunteer_notes) do |volunteer_note|
  json.extract! volunteer_note, :id, :user_id, :created_by_user_id, :description
  json.url volunteer_note_url(volunteer_note, format: :json)
end
