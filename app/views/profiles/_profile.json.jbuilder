json.extract! profile, :id, :first_name, :last_name, :created_at, :bio, :karma_coins, :host_rating, :guest_rating, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
