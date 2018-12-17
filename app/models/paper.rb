class Paper < ApplicationRecord
  has_many :orders, dependent: :nullify
end
