class Operation < ApplicationRecord
  belongs_to :order
  belongs_to :machine
end
