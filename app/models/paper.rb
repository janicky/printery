class Paper < ApplicationRecord
  has_many :orders, dependent: :nullify

  REGEX = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :name, presence: true, length: { minimum: 2, maximum: 40 }
  validates :grammage, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, format: { with: REGEX }, numericality: { greater_than: 0 }
end
