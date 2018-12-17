class Machine < ApplicationRecord
  self.inheritance_column = "kind"
  has_many :operations, dependent: :nullify

  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :type, presence: true, inclusion: { in: %w[printer cutter gluing refinment] }
  validates :since_cleaning, numericality: { only_integer: true }
end
