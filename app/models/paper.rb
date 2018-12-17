class Paper < ApplicationRecord
  has_many :orders, dependent: :nullify

  validates :name, presence: true, length: { minimum: 2, maximum: 40 }
  validates :grammage, presence: true, numericality: { only_integer: true }
end
