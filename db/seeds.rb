ladys = Category.create(name: "")

ladys_tops = 

mens = Category.create(name: "メンズ")

mens_tops = mens.children.create(name: "トップス")

mens_tops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])