class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :profile
  end
end
