class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
    has_ancestry
    has_many :items
      t.timestamps
    end
  end
end
