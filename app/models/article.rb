class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :body, presence: true
end
