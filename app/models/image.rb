class Image < ApplicationRecord
  belongs_to :exhibition, inverse_of: :images
  mount_uploaders :image, ImagesUploader

  validates :image, presence: true
end
