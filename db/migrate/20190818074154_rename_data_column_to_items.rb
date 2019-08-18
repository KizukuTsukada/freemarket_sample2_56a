class RenameDataColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :deliver_data, :deliver_date 
  end
end
