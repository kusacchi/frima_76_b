class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :city, null: false
      t.string :address, null: false
      t.string :post_code, null: false
      t.integer :prefecture_code, null:false, foreign_key:true
      t.string :building_name
      t.string :phone_number
      t.integer :user_id
      t.timestamps
    end
  end
end
