json.array!(@boletas_de_depositos) do |boleta_de_deposito|
  json.extract! boleta_de_deposito, :id, :banco_id, :persona_id, :cuenta_bancaria_id, :caja_id, :fecha
  json.url boleta_de_deposito_url(boleta_de_deposito, format: :json)
end
