json.array!(@preference_types) do |preference_type|
  json.extract! preference_type, :id, :name
  json.url preference_type_url(preference_type, format: :json)
end
