class Item < ApplicationRecord
  has_many :photos
  accepts_nested_attributes_for :photos

  belongs_to :brand
  accepts_nested_attributes_for :brand
  
  accepts_nested_attributes_for :category

  # itemsテーブルのsaler_idとbuyer_idをusersテーブルと紐ずけ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
