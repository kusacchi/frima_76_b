class Category < ApplicationRecord
  has_many :exhibitions
  has_ancestry
end
