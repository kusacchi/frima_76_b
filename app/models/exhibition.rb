class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :brand, optional: true, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to_active_hash :place
  has_many :images, dependent: :destroy, inverse_of: :exhibition
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :brand
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  validates_associated :images
  validates_associated :category

  with_options presence: true do
    validates :images
    validates :name
    validates :explanatory
    validates :cost
    validates :prefecture_code
    validates :day
    validates :price,      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :user_id
    validates :category_id
    validates :status
  end
end
