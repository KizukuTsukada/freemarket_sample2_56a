class CreateSerches < ActiveRecord::Migration[5.2]
  def change
    create_table :serches do |t|
      t.string       :name, unique: true
      t.references   :item, foreign_key: true
      t.timestamps
    end
  end
end
