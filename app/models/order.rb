class Order < ApplicationRecord
  has_one :release_receipt, dependent: :destroy
  has_many :operations, dependent: :destroy
  belongs_to :company
  belongs_to :paper_size
  belongs_to :paper
  belongs_to :color_palette

  REGEX = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :company, presence: true
  validates :price, presence: true, format: { with: REGEX }, numericality: { greater_than: 0 }
  validates :count, presence: true, numericality: { only_integer: true }
  validates :deadline, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 255 }
  validates :paper_size, presence: true
  validates :paper, presence: true
  validates :color_palette, presence: true

  scope :not_started, -> { all.select { |order| order.status == 0 } }
  scope :in_progress, -> { all.select { |order| order.status == 1 } }
  scope :canceled, -> { all.select { |order| order.status == 2 } }
  scope :finished, -> { all.select { |order| order.status == 3 } }

  def status
    status = 0
    return status if operations.count == 0

    status = 1 if operations.where(status: 1).count > 0
    status = 2 if operations.where(status: 2).count == operations.count
    status = 3 if operations.where(status: 3).count == operations.count
    status
  end
end
