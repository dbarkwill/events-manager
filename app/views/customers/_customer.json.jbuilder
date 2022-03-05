json.extract! customer, :id, :customer_number, :barcode, :name, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)
