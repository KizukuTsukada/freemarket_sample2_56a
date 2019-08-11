class RemoveUserIdFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_reference :profiles, :user
  end
end
