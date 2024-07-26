class Hero < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, presence: true
  validates :image, presence: true

  has_one_attached :image

  before_validation :set_default_image, if: -> { image.blank? }
  after_create :add_initial_candle

  private

  def set_default_image
    self.image.attach(io: File.open(Rails.root.join('app/assets/images/flowers.png')), filename: 'flowers.png') if image.blank?
  end

  def add_initial_candle
    update(candles: 1)
  end
end
