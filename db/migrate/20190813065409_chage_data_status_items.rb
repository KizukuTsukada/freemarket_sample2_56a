class ChageDataStatusItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items,:status, :string
    change_column :items,:pay_way, :string
    change_column :items,:deliver_way, :string
    change_column :items,:deliver_date, :string
    change_column :items,:deliver_fee, :string
  end
end
