class CreateAccommodationreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodationreviews do |t|
      t.integer :communication_rating
      t.integer :location_rating
      t.integer :cleanliness_rating
      t.integer :ammenities_rating
      t.integer :host_rating
      t.text :comments
      t.datetime :created_at
      t.references :stay, foreign_key: true

      t.timestamps
    end
  end
end
