class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.datetime :date_created
      t.string :name
      t.text :description
      t.string :country
      t.string :city
      t.string :address
      t.references :user, foreign_key: true
      t.float :accommodation_rating
      t.datetime :available_start_date
      t.datetime :available_end_date
      t.references :accomtype, foreign_key: true

      t.timestamps
    end
  end
end
