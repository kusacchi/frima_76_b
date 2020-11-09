# 概要
テックキャンプのチーム開発にて作成したアプリケーションを紹介します。

# アプリケーション情報
## アプリケーション概要
フリーマーケットのWebアプリケーションをチームで開発しました。
### 接続先情報
URL  http://3.114.76.107/
### ID/Pass(basic認証キー)
ID: admin760b

Pass: pass760b

### テスト用アカウント等
#### 購入者用
メールアドレス: buyer@gmail.com

パスワード: buyer11

#### 購入用カード情報
番号： 4012888888881881

期限： Fri Oct 30 2020 00:00:00 GMT+0900 (日本標準時)

セキュリティコード：9876

#### 出品者用
メールアドレス名: seller@gmail.com

パスワード: seller11

# 開発状況
## 開発環境
Ruby/Ruby on Rails/MySQL/Java Script/Github/AWS/Visual Studio Code
## 開発期間と平均作業時間
開発期間：2020年 8/1~10/15 (76日間)

1日あたりの平均作業時間：3

## 開発体制
人数：3

アジャイル型開発（スクラム）

Trelloによるタスク管理

# 動作確認方法
Chromeの最新版を利用してアクセスしてください。

ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。

接続先およびログイン情報については、上記の通りです。

同時に複数の方がログインしている場合に、ログインできない可能性がございます。

テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

テストアカウントでログイン→トップページ下にあるピックアップカテゴリーから商品を選択→商品詳細画面から購入画面に進むを選択→商品購入

確認後、ログアウト処理をお願いします。

# 制作メンバー
## 草野晴也
### 担当箇所
&emsp;本番環境へのデプロイ  
&emsp;AWS EC2〜S3導入  
&emsp;basic認証  
&emsp;ユーザーマイページ  
&emsp;商品詳細画面  
&emsp;商品出品画面  
&emsp;商品購入機能（Payjp)  
&emsp;クレジットカード登録（Payjp)  
&emsp;クレジットカード情報表示(Payjp)

## 吉田大地
### 担当箇所
&emsp;トップページ  
&emsp;商品一覧表示  
&emsp;ユーザー新規登録/ログイン（サーバーサイド）  
&emsp;商品購入確認画面  
&emsp;商品購入機能  
&emsp;商品出品機能  
&emsp;商品情報編集

## 濱田和輝
### 担当箇所
&emsp;スクラムマスター  
&emsp;DB設計  
&emsp;ユーザー新規登録/ログイン（フロントエンド）  
&emsp;商品購入確認画面  
&emsp;商品出品機能  
&emsp;商品詳細表示  
&emsp;カテゴリ機能  
&emsp;商品情報編集  
&emsp;商品削除

# DB設計
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
- has_one :cards, dependent: :destroy
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
|buyer_id|integer||
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|status|string|null: false|
### Association
- has_many :images
- belongs_to :user
- belongs_to :brand
- belongs_to :category
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
|ancestry|string|-------|
### Association
- has_many :exhibitions
* gem ancestryを使用する
