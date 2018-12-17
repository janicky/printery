class ColorPalette < ApplicationRecord
  has_many :orders, dependent: :nullify
end
