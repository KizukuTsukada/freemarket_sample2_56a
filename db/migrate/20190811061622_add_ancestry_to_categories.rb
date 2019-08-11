class AddAncestryToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :ancestry, :integer, null: false
  end
end
