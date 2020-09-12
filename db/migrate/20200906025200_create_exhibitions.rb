class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string  :name,            null:false
      t.text    :explanatory,     null:false
      t.string  :cost,            null:false
      t.integer :prefecture_code, null:false
      t.string  :day,             null:false
      t.integer  :price,           null:false
      t.integer :user_id,         null:false,      foreign_key:true
      t.integer :brand_id,        foreign_key:true
      t.integer :category_id,     null:false,      foreign_key:true
      t.string  :status,          null:false
      t.integer :buyer_id
      t.timestamps 
    end
  end
end
