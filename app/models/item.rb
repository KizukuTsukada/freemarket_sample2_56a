class Item < ApplicationRecord
  # 商品画像
  has_many :photos
  accepts_nested_attributes_for :photos

  belongs_to :brand, optional: true
  # accepts_nested_attributes_for :brand, optional: true
  
  belongs_to :categorie, optional: true

  # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: (300..9999999) }

  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end 
end

# とりあえずoptional: trueしてる
