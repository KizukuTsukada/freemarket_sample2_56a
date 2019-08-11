class Item < ApplicationRecord
  # 商品画像
  has_many :photos
  accepts_nested_attributes_for :photos

  belongs_to :brand
  accepts_nested_attributes_for :brand
  
  belongs_to :category

  # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :name, presence: true, length: { maximum: 40 }
  validates :dedail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: (300..9999999) }

end
