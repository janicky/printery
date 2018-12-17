class Machine < ApplicationRecord
  has_many :operations, dependent: :nullify
end
