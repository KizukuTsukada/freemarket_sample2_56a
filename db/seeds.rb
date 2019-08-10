lady = Category.create(name:"レデイース")

lady_tops = lady.children.create(name: "トップス")
lady_tops.children.create([{name:"Tシャツ"}, {name:"ジャケット"}])
lady_pants = lady.children.create(name:"パンツ")
lady_pants.children.create([{name:"デニム"}, {name:"スカート"}])

men = Category.create(name:"メンズ")

men_tops = men.children.create(name:"トップス")
men_tops.children.create([{name:"Tシャツ"}, {name:"ジャケット"}])
men_pants = pants.children.create(name:"パンツ")
men_pants.children.create([{name:"デニム"}, {name:"チノパン"}])

entertainments = Category.create(name: "本・音楽")

entbook = entertainments.children.create(name:"本")
entbook.children.create([{name:"漫画"}, {name:"ラノベ"}])
entmusic = entertainments.children.create("音楽")
entmusic.entertainments.create([{name:"洋楽"}, {name:"邦楽"}])

sports = Category.create(name:"スポーツ")

sports_soccer = sports.children.create(name:"サッカー")
sports_soccer.children.create([{name:"ユニフォーム"}, {name:"ボール"}])
saports_baseball = sports.children.create(name:"野球")
saports_baseball.children.create([{name:"ユニフォーム"}, {name:"グローブ"}])