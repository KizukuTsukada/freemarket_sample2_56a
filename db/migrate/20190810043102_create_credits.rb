class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table  :credits do |t|
      t.integer   :card_no, null: false, unique: true
      t.integer   :validity_year, null: false
      t.integer   :validity_month, null: false
      t.integer   :security_no, null: false
      t.timestamps
    end
  end
end
