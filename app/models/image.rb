class Image < ApplicationRecord
  belongs_to :exhibition, inverse_of: :images
  mount_uploader :image, ImagesUploader

  validates :image, presence: true
end
