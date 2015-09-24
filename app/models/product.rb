class Product < ActiveRecord::Base
  validates :product_name, :brand, :description, :price, :quantity, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 100 }
end
