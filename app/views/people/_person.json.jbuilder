json.extract! person, :id, :user_id, :first_name, :last_name, :document_number, :direction, :phone, :card, :created_at, :updated_at
json.url person_url(person, format: :json)
