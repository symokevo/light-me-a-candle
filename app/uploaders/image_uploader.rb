require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :store_dimensions
  plugin :versions
  plugin :default_url
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 1.megabyte, message: "is too large (max is 1 MB)"
    validate_mime_type %w[image/jpeg image/png image/webp]
  end

  def process(io, context)
    if context[:phase] == :store
      versions = { original: io }
      versions[:thumb] = resize_to_limit(io.download, 200, 200)
      versions
    end
  end

  def default_url(context)
    ActionController::Base.helpers.asset_path("flowers.png")
  end

  private

  def resize_to_limit(image, width, height)
    ImageProcessing::MiniMagick
      .source(image)
      .resize_to_limit(width, height)
      .call
  end
end
