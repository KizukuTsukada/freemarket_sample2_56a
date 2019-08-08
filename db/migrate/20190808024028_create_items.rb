class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name 
      t.integer      :price, null: false
      t.string       :size 
      t.integer      :status, null: false
      t.integer      :pay_way  
      t.integer      :deliver_way
      t.integer      :deliver_data  
      t.integer      :deliver_fee
      t.integer      :saler
      t.integer      :buyer
      t.text         :detail

      t.references   :photo_id, foreign_key: true        
      t.references   :brand_id, foreign_key: true       
      t.references   :category_id, foreign_key: true
      t.timestamps
    end
  end
end
