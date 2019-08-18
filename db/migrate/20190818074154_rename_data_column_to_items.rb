class RenameDataColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :deliver_date, :deliver_date 
  end
end
