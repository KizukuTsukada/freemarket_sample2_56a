class RenameTitreColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :seler, :seler_id
    rename_column :items, :buyer,  :buyer_id
  end
end
