json.array!(@movimientos_de_bancos_detalles) do |movimiento_de_banco_detalle|
  json.extract! movimiento_de_banco_detalle, :id, :movimiento_de_banco_id, :cuenta_bancaria_id, :descripcion, :monto
  json.url movimiento_de_banco_detalle_url(movimiento_de_banco_detalle, format: :json)
end
