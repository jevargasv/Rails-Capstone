class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fill: [200, 200, :north]
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  CarrierWave.configure do |config|
    config.cache_storage = :file
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
