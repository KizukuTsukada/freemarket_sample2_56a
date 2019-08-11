class Photo < ApplicationRecord
  belongs_to :item

  # 後でコメントアウト外す
  # validates :image, presence: true 
end
