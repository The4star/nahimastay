class AddLongitudeToAccommodations < ActiveRecord::Migration[5.2]
  def change
    add_column :accommodations, :latitude, :float
  end
end
