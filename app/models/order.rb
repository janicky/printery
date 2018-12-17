class Order < ApplicationRecord
  belongs_to :company
  belongs_to :paper_size
  belongs_to :paper
  belongs_to :color_palette
end
