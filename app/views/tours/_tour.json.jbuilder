json.extract! tour, :id, :name, :description, :country, :price, :rate, :created_at, :updated_at
json.url tour_url(tour, format: :json)
