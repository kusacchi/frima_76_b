# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# frima_76_bのDB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|email|string|null: false|
|birthday|date|null: false|
|image|string||
|introduction|text||
|nickname|string|null: false|
|password|string|null: false|
### Association
- has_many :exhibitions, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :purchases, dependent: :destroy

## exhibitionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanatory|text|null: false|
|cost|string|null: false|
|prefecture_code|integer|null: false|
|day|string|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|status|string|null: false|
### Association
- has_many :images
- belongs_to :user, dependent: :destroy
- belongs_to :brand, dependent: :destroy
- belongs_to :category, dependent: :destroy
- belongs_to_active_hash :prefecture

# purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_code|string|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string||
### Association
- belongs_to :user
* jp_prefectureを使用する

# cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
* pay.jpを使用する

# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|exhibition_id|integer|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :exhibition

# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :exhibitions

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :exhibitions
* gem ancestryを使用する