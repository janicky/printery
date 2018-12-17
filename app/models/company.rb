class Company < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :tax_number, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
