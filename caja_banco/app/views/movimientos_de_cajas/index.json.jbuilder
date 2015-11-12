json.array!(@movimientos_de_cajas) do |movimiento_de_caja|
  json.extract! movimiento_de_caja, :id, :tipo_de_movimiento_id, :caja_id, :descripcion
  json.url movimiento_de_caja_url(movimiento_de_caja, format: :json)
end
