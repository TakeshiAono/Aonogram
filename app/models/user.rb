class User < ApplicationRecord

  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  has_secure_password
  mount_uploader :image, ImageUploader
  
end
