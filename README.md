# README

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|price|integer|null: false|
|size|string||
|status|integer|null: false|
|pay_way|integer||
|deliver_way|integer||
|deliver_data|integer||
|deliver_fee|integer||
|saler|integer||
|buyer|integer||
|detail|text|null: false|
|photo_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- has_many :users, through: :trades
- has_many :photos
- belongs_to :brand
- belongs_to :category



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|gender|integer|null: false|
|introduction|text|
|email|string|null: false, unique: true|
|profile_id|references|foreign_key: true|
|credit_id|references|foreign_key: true|

### Association
- has_many :items, through: :trades
- belongs_to :credit
- belongs_to :profile



## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|                 
|birth_day|integer|null: false| 
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address1|string|null: false|               
|address2|string||
|phone_number|string|null: false|

### Association
- belongs_to :user



## creditテーブル
|Column|Type|Options|
|------|----|-------|
|card_no|integer|null: false, unique: true|
|validity_year|integer|null: false|
|validity_month|integer|null: false|
|security_no|integer|null: false|

### Association
- belongs_to :user



## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|item_id|references|foreign_key: true|

### Association
- belongs_to :item



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|unique: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_ancestry



## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item