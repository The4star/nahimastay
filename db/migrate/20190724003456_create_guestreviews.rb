class CreateGuestreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :guestreviews do |t|
      t.datetime :created_at
      t.integer :cleanliness_rating
      t.integer :communication_rating
      t.integer :ease_of_hosting_rating
      t.text :comments
      t.references :stay, foreign_key: true

      t.timestamps
    end
  end
end
