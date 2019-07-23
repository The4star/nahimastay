class CreateAccomtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :accomtypes do |t|
      t.string :name
      t.string :description
      t.float :cost

      t.timestamps
    end
  end
end
