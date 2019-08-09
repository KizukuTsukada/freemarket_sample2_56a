# README

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|size|string|null: false|
|status|integer|null: false|
|pay_way|integer|null: false|
|deliver_way|integer|null: false|
|deliver_date|integer|null: false|
|deliver_fee|integer|null: false|
|saler_id|integer||
|buyer_id|integer||
|detail|text|null: false|
|brand_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- has_many :photos
- belongs_to :brand
- belongs_to :category
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"



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
- belongs_to :credit
- belongs_to :profile
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"


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
|image|string|null: false|
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



### Association
- belongs_to :user
- belongs_to :item