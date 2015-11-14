json.array!(@movimientos_de_cajas_detalles) do |movimiento_de_caja_detalle|
  json.extract! movimiento_de_caja_detalle, :id, :movimiento_de_caja_id, :cheque_entrante_id, :cheque_propio_id, :monto_efectivo, :monto_cheque, :descripcion
  json.url movimiento_de_caja_detalle_url(movimiento_de_caja_detalle, format: :json)
end
