class Photo < ApplicationRecord
  belongs_to :item

  # 画像選択部分の実装ができたらコメントアウト外す
  # validates :image, presence: true 
end
