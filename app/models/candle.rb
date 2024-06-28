class Candle < ApplicationRecord
  belongs_to :hero
  belongs_to :user
end
