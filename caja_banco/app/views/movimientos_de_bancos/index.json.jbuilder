json.array!(@movimientos_de_bancos) do |movimiento_de_banco|
  json.extract! movimiento_de_banco, :id, :tipo_de_movimiento_id, :banco_id, :descripcion
  json.url movimiento_de_banco_url(movimiento_de_banco, format: :json)
end
