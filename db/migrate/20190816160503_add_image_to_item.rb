class AddImageToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :image, :string, after: :name
  end
end
