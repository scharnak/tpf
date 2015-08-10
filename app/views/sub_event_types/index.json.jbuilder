json.array!(@sub_event_types) do |sub_event_type|
  json.extract! sub_event_type, :id, :name, :description
  json.url sub_event_type_url(sub_event_type, format: :json)
end
