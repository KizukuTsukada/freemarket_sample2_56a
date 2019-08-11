class Category < ApplicationRecord
  has_ancestry
end

mens = Category.create(name: "メンズ")

mens_tops = mens.children.create(name: "トップス")

mens_tops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])