class Purchase < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :post_code, presence: true, numericality: { only_integer: true }
    validates :prefecture_code, presence: true
    validates :city, presence: true
    validates :address, presence: true
    validates :user_id, presence: true 
  end
  validates :phone_number, numericality: { only_integer: true }, allow_blank: true
end
