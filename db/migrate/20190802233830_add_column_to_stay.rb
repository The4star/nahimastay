class AddColumnToStay < ActiveRecord::Migration[5.2]
  def change
    add_column :stays, :cancelled, :boolean
  end
end
