class Purchase < ApplicationRecord
  belongs_to :user

  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :user_id, presence: true 
end
