class PaperSize < ApplicationRecord
  has_many :orders, dependent: :nullify
end
