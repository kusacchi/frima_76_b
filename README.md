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
|family-name|string|null: false|
|first-name|string|null: false|
|family-name-kana|string|null: false|
|first-name-kana|string|null: false|
|email|string|null: false|
|birthday|date|null: false|
|user-image|string||
|introduction|text||
|nickname|string|null: false|
|password|string|null: false|
### Association
- has_many :exhibition, dependent: :destroy
- belongs_to :card, dependent: :destroy
- belongs_to :purchase, dependent: :destroy

## exhibitionテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
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
|image_id|integer|null: false|
### Association
- has_many :image
- belongs_to :user, dependent: :destroy
- belongs_to :brand, dependent: :destroy
- belongs_to :category, dependent: :destroy
- belongs_to_active_hash :prefecture

# purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|family-name|string|null: false|
|first-name|string|null: false|
|family-name-kana|string|null: false|
|first-name-kana|string|null: false|
|post-code|string|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building-name|string||
|phone-number|string||
### Association
- belongs_to :user
* jp_prefectureを使用する

# cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
* pay.jpを使用する

# imageテーブル
|Column|Type|Options|
|------|----|-------|
|exhibition_id|integer|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :exhibition

# brandテーブル
|Column|Type|Options|
|------|----|-------|
|exhibition_id|integer|null: false, foreign_key: true|
|name|string|null: false|
### Association
- has_many :exhibition

# categoryテーブル
|Column|Type|Options|
|------|----|-------|
|exhibition_id|integer|null: false, foreign_key: true|
|name|string|nnull: false|
### Association
- has_many :exhibition