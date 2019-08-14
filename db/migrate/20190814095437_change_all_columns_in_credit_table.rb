class ChangeAllColumnsInCreditTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :card_no
    remove_column :credits, :validity_year
    remove_column :credits, :validity_month
    remove_column :credits, :security_no

    add_column :credits, :card_id, :string, null: false
    add_column :credits, :customer_id, :string, null: false
  end
end
