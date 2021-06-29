class User < ApplicationRecord
  has_many :meals, dependent: :destroy

  validates :email, presence: true

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
  )
end
