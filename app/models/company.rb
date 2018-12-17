class Company < ApplicationRecord
  has_many :orders, dependent: :destroy
end
