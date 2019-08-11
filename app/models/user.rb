class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :book
  accepts_nested_attributes_for :book

  has_one :credit
  accepts_nested_attributes_for :credit

  # 購入した商品 →bought_items。itemsテーブルの「buyer_id」(購入者)とuserの「id」と紐かせる
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  # 現在売っている」商品 →saling_items。
  # buyer_idがNULLのとき →:saling_items, -> { where("buyer_id is NULL") }(SQL文)
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
end