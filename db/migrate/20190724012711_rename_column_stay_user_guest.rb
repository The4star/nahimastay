class RenameColumnStayUserGuest < ActiveRecord::Migration[5.2]
  def change
    rename_column :stays, :user_id, :guest_id
  end
end
