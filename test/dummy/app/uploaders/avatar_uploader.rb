class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file
end