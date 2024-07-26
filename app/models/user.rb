class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :heroes, foreign_key: 'created_by_id'
  # has_many :candles
  # has_many :notes

  enum role: { user: 0, admin: 1 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
end
