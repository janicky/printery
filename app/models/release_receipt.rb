class ReleaseReceipt < ApplicationRecord
  belongs_to :order
  belongs_to :user

  REGEX = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :order, presence: true
  validates :release_date, presence: true
  validates :user, presence: true
  validates :price, presence: true, format: { with: REGEX }, numericality: { greater_than: 0 }
end
