class Hero < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :candles
  has_many :notes
end
