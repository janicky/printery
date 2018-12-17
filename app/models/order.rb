class Order < ApplicationRecord
  has_one :release_receipt, dependent: :destroy
  belongs_to :company
  belongs_to :paper_size
  belongs_to :paper
  belongs_to :color_palette
end
