class Operation < ApplicationRecord
  belongs_to :order
  belongs_to :machine

  validates :order, presence: true
  validates :machine, presence: true
  validates :status, presence: true, inclusion: { in: [*0...3] }
  validates :priority, presence: true, numericality: { only_integer: true }
end
