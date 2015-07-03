json.array!(@sub_events) do |sub_event|
  json.extract! sub_event, :id, :event_id, :name, :intern_num, :staff_num, :community_num
  json.url sub_event_url(sub_event, format: :json)
end
