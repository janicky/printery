class Report < ApplicationRecord
  REGEX = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :from, presence: true
  validates :to, presence: true
  validates :income, presence: true, format: { with: REGEX }
  validates :orders, presence: true, numericality: { only_integer: true }
end
