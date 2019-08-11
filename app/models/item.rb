class Item < ApplicationRecord
  has_many :photos
  belongs_to :brand
  belongs_to :category

  
  # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
