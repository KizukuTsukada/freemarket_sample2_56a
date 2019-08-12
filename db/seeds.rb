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

entertainments = Category.create(name: "本・CD")

entbook = entbook.children.create(name: "本")
entbook.children.create([{name: "小説"}, {name: "漫画"}])

entmusic = entmusic.children.create(name: "音楽")
entmusic.children.create([{name: "洋楽"}, {name: "邦楽"}])