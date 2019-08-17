crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :mylist_mypages do
  link "出品した商品-出品中", mylist_mypages_path
  parent :mypage
end

crumb :show do
  link "出品商品画面", item_path(:id)
  parent :mypage
  parent :list
end

crumb :pay_way do
  link "支払い方法", pay_way_mypages_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_mypages_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypage
end

crumb :item do
  link " 出品商品画面", item_path
  parent :mylist_mypages
end