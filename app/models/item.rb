class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
  has_many :users, through: :trades
  has_many :photos
  belongs_to :brand
  belongs_to :category
end
