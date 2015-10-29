json.array!(@chequeras) do |chequera|
  json.extract! chequera, :id, :cuenta_bancaria_id
  json.url chequera_url(chequera, format: :json)
end
