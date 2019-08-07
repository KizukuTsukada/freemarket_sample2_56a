class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.string    :nickname, null: false
      t.string    :family_name_kanji, null: false
      t.string    :first_name_kanji, null: false
      t.string    :family_name_kana, null: false
      t.string    :first_name_kana, null: false

      t.integer   :birth_year, null: false
      t.integer   :birth_month, null: false
      t.integer   :birth_day, null: false

      t.string    :postal_code, null: false
      t.string    :prefectures, null: false
      t.string    :city, null: false
      t.string    :address1, null: false
      t.string    :address2

      t.string    :phone_number, null: false

      t.timestamps
    end
  end
end
