class Order < ApplicationRecord
  has_one :release_receipt, dependent: :destroy
  has_many :operations, dependent: :destroy
  belongs_to :company
  belongs_to :paper_size
  belongs_to :paper
  belongs_to :color_palette

  def status
    status = 0
    return status if operations.count == 0

    status = 1 if operations.where(status: 1).count > 0
    status = 2 if operations.where(status: 2).count == operations.count
    status = 3 if operations.where(status: 3).count == operations.count
    status
  end
end
