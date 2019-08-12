class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  accepts_nested_attributes_for :profile

  has_one :credit
  accepts_nested_attributes_for :credit

  # 購入した商品 →bought_items。itemsテーブルの「buyer_id」(購入者)とuserの「id」と紐かせる
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  # 現在売っている」商品 →saling_items。
  # buyer_idがNULLのとき →:saling_items, -> { where("buyer_id is NULL") }(SQL文)
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  def self.find_oauth(auth)
    # snsのユーザーのidとproviderを変数に代入
    uid = auth.uid
    provider = auth.provider
    # DBにすでにsns情報を保存しているユーザーのuidとproviderを代入
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    # DBにすでに存在していればそのユーザーを探してそのユーザーを返す
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
    # snsでのアプリへの登録はないがsns上のemailと同一のemailアドレスを持つユーザーの場合はsnsの情報をsnsCredentialsテーブルに追加
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
    # snsでの登録もユーザーの登録もない場合はnilを返す
        user = nil
      end
    end
    return user
  end
end
