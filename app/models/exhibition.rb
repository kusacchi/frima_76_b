class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to_active_hash :place
  has_many :images, dependent: :destroy, inverse_of: :exhibition
  accepts_nested_attributes_for :images
  
  validates_associated :images
  validates_associated :category

  validates :images,          presence: true
  validates :name,            presence: true
  validates :explanatory,     presence: true
  validates :cost,            presence: true
  validates :prefecture_code, presence: true
  validates :day ,            presence: true
  validates :price,           presence: true ,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :user_id,         presence: true
  validates :category_id,     presence: true
  validates :status,          presence: true
end
