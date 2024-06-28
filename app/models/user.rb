class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :heroes, foreign_key: 'created_by_id'
  has_many :candles
  has_many :notes
end
