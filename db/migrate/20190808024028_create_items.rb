class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name 
      t.integer      :price, null: false
      t.string       :size 
      t.integer      :status, null: false
      t.integer      :pay_way  
      t.integer      :deliver_way
      t.integer      :deliver_date  
      t.integer      :deliver_fee
      t.integer      :saler
      t.integer      :buyer
      t.text         :detail

      t.timestamps
    end
  end
end
