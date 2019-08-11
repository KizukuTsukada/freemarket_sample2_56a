ladys = Category.create(name: "レディース")

ladys_tops = ladys.children.create(name: "トップス")
ladys_tops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])

ladys_pants = ladys.children.create(name: "パンツ")
ladys_pants.children.create([{name: "デニム"}, {name: "スカート"}])

mens = Category.create(name: "メンズ")

mens_tops = mens.children.create(name: "トップス")
mens_tops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])

mens_pants = mens.children.create(name: "パンツ")
mens_pants.children.create([{name: "デニム"}, {name: "チノパン"}])