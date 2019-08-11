class Category < ApplicationRecord
  has_ancestry
end

# レディースブロック

# レディースの子カテゴリー配列
lady_child_array = ['トップス', 'パンツ']
# レディースの孫カテゴリー配列
lady_grandchild_array = ['Tシャツ', 'ジャケツト', 'デニム', 'スカート']

parent = Category.create(neme: 'レディース')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# メンズブロック

# メンズの子カテゴリー配列
men_child_array = ['トップス', 'パンツ']
# メンズの孫カテゴリー配列
men_grandchild_array = ['Tシャツ', 'ジャケット', 'デニム', 'チノパン']

parent = Category.create(name: 'メンズ')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# エンターテイメントブロック

# エンターテイメントの子カテゴリー配列
entertainments_child_array = ['本・音楽']
# エンターテイメントの孫カテゴリー配列
entertainments_grandchild_array = ['漫画', 'ラノベ', '洋楽', '邦楽']

parent = Category.create(name: '本・音楽')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end