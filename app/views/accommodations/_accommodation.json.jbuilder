json.extract! accommodation, :id, :date_created, :name, :description, :country, :city, :address, :user_id, :accommodation_rating, :available_start_date, :available_end_date, :accomtype_id, :created_at, :updated_at
json.url accommodation_url(accommodation, format: :json)
