class Product < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :product_name, :brand, :description, :price, :quantity, :category_id, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 100 }
  validates :category_id, :numericality => { :greater_than_or_equal_to => 1 }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
