class Item < ApplicationRecord
  # 商品画像

  # photosテーブルを使用することになったら
  # has_many :photos, dependent: :destroy
  mount_uploader :image, ImagesUploader

  # accepts_nested_attributes_for :photos
  # 別テーブルに保存することになったら使う

  belongs_to :brand, optional: true
  # accepts_nested_attributes_for :brand, optional: true
  
  belongs_to :categorie, optional: true

  # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1,000 }
  validates :price, presence: true, inclusion: { in: (300..999999) }

  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end 
end

# 実装できないかもしれないのでとりあえずoptional: trueしてる。
