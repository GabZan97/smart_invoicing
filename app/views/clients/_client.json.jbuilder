json.extract! client, :id, :name, :codice_fiscale, :email, :partita_iva, :created_at, :updated_at
json.url client_url(client, format: :json)
