class RenameTitreColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :seller, :seller_id
    rename_column :items, :buyer,  :buyer_id
  end
end
