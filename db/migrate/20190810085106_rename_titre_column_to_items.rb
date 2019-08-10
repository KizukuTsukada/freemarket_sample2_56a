class RenameTitreColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :saler, :saler_id
    rename_column :items, :buyer,  :buyer_id
  end
end
