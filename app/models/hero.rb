class Hero < ApplicationRecord
  require 'fastimage'

  self.table_name = 'heroes'
  belongs_to :created_by, class_name: 'User'
  has_many :candles, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true

  before_validation :set_default_image, if: -> { image.blank? }
  after_create :add_initial_candle

  include ImageUploader::Attachment(:image)

  private

  def set_default_image
    self.image = File.open(Rails.root.join('app/assets/images/flowers.png')) if image.blank?
  end

  def add_initial_candle
    candles.create!(created_by: created_by)
  end
end
