class Place < ActiveRecord::Base
  # prefecture_code:integer
  include JpPrefecture
  jp_prefecture :prefecture_code
end