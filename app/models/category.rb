class Category < ApplicationRecord
  has_ancestry
end

# レディースブロック

# レディースの子カテゴリー配列
lady_child_array = ['トップス', 'パンツ']
#レディースの孫カテゴリー配列
lady_grandchild_array = ['Tシャツ', 'ジャケツト']