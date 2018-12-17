class ColorPalette < ApplicationRecord
  has_many :orders, dependent: :nullify
  REGEX = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :price, presence: true, format: { with: REGEX }, numericality: { greater_than: 0 }
end
