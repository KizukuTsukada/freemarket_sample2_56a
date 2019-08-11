class Item < ApplicationRecord
  has_many :photos
  belongs_to :brand
  belongs_to :categorie

  # saler_idとbuyer_idをusersテーブルと結ぶ
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
