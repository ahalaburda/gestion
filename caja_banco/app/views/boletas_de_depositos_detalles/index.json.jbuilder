json.array!(@boletas_de_depositos_detalles) do |boleta_de_deposito_detalle|
  json.extract! boleta_de_deposito_detalle, :id, :boleta_de_deposito_id, :cheque_entrante_id, :monto_efectivo, :monto_cheque, :total
  json.url boleta_de_deposito_detalle_url(boleta_de_deposito_detalle, format: :json)
end
