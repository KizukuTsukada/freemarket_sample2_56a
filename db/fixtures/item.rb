User.seed do |s|
  s.id = 1
  s.nickname = "松本"
  s.gender = "男性"
  s.introduction = "よろしく"
  s.email = "test@gmail.com"
  s.password = "pppppp"
end

User.seed do |s|
  s.id = 2
  s.nickname = "櫻井"
  s.gender = "男性"
  s.introduction = "よろしく"
  s.email = "test2@gmail.com"
  s.password = "pppppp"
end

User.seed do |s|
  s.id = 3
  s.nickname = "大野"
  s.gender = "男性"
  s.introduction = "よろしく"
  s.email = "test3@gmail.com"
  s.password = "pppppp"
end

Item.seed do |s|
  s.id = 1
  s.name = "小説"
  s.price = 400
  s.size =
  s.status = 0
  s.pay_way = 0
  s.deliver_way = 0
  s.deliver_date = 0
  s.deliver_fee = 0
  s.saler_id = 1
  s.buyer_id = 2
  s.detail = "面白いです。"
  s.situation = "売り切れ"
end

Item.seed do |s|
  s.id = 2
  s.name = "ズボン"
  s.price = 1500
  s.size = "M"
  s.status = 0
  s.pay_way = 0
  s.deliver_way = 0
  s.deliver_date = 0
  s.deliver_fee = 0
  s.saler_id = 2
  s.buyer_id = 3
  s.detail = "一度しか履いていません。"
  s.situation = "販売中"
end

Item.seed do |s|
  s.id = 3
  s.name = "シャツ"
  s.price = 1000
  s.size = "S"
  s.status = 0
  s.pay_way = 0
  s.deliver_way = 0
  s.deliver_date = 0
  s.deliver_fee = 0
  s.saler_id = 3
  s.buyer_id = ""
  s.detail = "一度も着ていません。"
  s.situation = "販売中"
end