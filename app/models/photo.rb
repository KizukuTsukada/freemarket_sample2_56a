class Photo < ApplicationRecord
  # optional: trueは後で消す
  belongs_to :item, optional: true

  validates :image, presence: true
end
