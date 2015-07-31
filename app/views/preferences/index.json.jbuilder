json.array!(@preferences) do |preference|
  json.extract! preference, :id, :preference_type_id, :name
  json.url preference_url(preference, format: :json)
end
