json.array!(@tipos_de_movimientos) do |tipo_de_movimiento|
  json.extract! tipo_de_movimiento, :id, :descripcion
  json.url tipo_de_movimiento_url(tipo_de_movimiento, format: :json)
end
