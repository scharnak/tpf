json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address1, :address2, :city, :state, :zipcode, :phone
  json.url restaurant_url(restaurant, format: :json)
end
