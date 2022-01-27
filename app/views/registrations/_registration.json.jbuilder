json.extract! registration, :id, :customer_id, :date, :dinner_count, :created_at, :updated_at
json.url registration_url(registration, format: :json)
