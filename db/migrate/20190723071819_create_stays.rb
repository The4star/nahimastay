class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.references :accommodation, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true
      t.datetime :created_at
      t.boolean :confirmed
      t.boolean :rejected

      t.timestamps
    end
  end
end
