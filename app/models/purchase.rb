class Purchase < ApplicationRecord
  belongs_to :user, optional: true


  with_options presence: true do
    validates :post_code, numericality: { only_integer: true }
    validates :prefecture_code
    validates :city
    validates :address
  end
  validates :phone_number, numericality: { only_integer: true }, allow_blank: true
end
