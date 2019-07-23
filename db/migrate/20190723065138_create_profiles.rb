class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :created_at
      t.text :bio
      t.integer :karma_coins
      t.float :host_rating
      t.float :guest_rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
