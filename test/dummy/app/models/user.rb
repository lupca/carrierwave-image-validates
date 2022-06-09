class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :avatar, image: { ratio_range: 1..1 }
end