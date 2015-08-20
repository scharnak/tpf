json.array!(@notifications) do |notification|
  json.extract! notification, :id, :type, :name, :body, :read
  json.url notification_url(notification, format: :json)
end
