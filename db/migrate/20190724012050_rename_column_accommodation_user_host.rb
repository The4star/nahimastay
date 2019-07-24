class RenameColumnAccommodationUserHost < ActiveRecord::Migration[5.2]
  def change
    rename_column :accommodations, :user_id, :host_id
  end
end
