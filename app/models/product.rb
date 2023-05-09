class Product < ApplicationRecord
  include ProductHelper
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, :price, :quantity, :category, presence: true
end
