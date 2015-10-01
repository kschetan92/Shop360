json.array!(@cities) do |city|
  json.extract! city, :id, :city_name
  json.url city_url(city, format: :json)
end
