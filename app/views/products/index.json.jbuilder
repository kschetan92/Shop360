json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :brand, :description, :price, :quantity
  json.url product_url(product, format: :json)
end
