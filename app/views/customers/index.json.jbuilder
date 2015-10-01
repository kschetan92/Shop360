json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :email, :mobile, :address, :country, :city, :pincode, :date_of_birth
  json.url customer_url(customer, format: :json)
end
