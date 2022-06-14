class User < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
