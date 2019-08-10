class AddSituationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :situation, :string, null: false, after: :detail
  end
end
