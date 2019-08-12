class ChangeTypeIntegerToBigintInCardNo < ActiveRecord::Migration[5.2]
  def change
    change_column :credits, :card_no, :bigint
  end
end
