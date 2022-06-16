class Picture < ApplicationRecord

  validates :coment, presence: true, length: {maximum: 20}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  
end
