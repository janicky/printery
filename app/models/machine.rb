class Machine < ApplicationRecord
  self.inheritance_column = "kind"
  has_many :operations, dependent: :nullify
end
