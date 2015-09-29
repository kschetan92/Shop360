class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy


  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, :address, presence: true
  validates :payment_mode , inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
