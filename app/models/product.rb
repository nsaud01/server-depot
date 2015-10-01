class Product < ActiveRecord::Base
  
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  
  attr_accessible :description, :image_url, :version, :title
  validates :title, :description, :image_url, presence: true
  validates :version, numericality: {greater_than_or_equal_to: 0.01}
# 
  validates :title, presence: true, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
validates :title, length: {minimum: 1}

private

# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
    end
   end
end