class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :release_receipts, dependent: :nullify

  validates :first_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :password, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
