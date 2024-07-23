class Hero < ApplicationRecord
  self.table_name = 'heroes'
  belongs_to :created_by, class_name: 'User'
  has_many :candles, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true

  has_one_attached :image

  before_validation :set_default_image, if: -> { image.blank? }
  after_create :add_initial_candle

  private

  def set_default_image
    self.image = File.open(Rails.root.join('app/assets/images/flowers.png')) if image.blank?
  end

  def add_initial_candle
    candles.create!(user_id: created_by_id, created_by_id: created_by_id)
  end
end
