class Item < ApplicationRecord
  has_many :users, through: :trades
  belongs_to :photo
  belongs_to :brand
  belongs_to :category
end
