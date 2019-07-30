class AddLatitudeToAccommodations < ActiveRecord::Migration[5.2]
  def change
    add_column :accommodations, :longitude, :float
  end
end
