class Item < ApplicationRecord
  has_many :users, through: :trades
  has_many :photos
  belongs_to :brand
  belongs_to :category
end