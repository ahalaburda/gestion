json.array!(@apertura_cajas_detalles) do |apertura_cajas_detalle|
  json.extract! apertura_cajas_detalle, :id, :cheque_entrante_id, :monto
  json.url apertura_cajas_detalle_url(apertura_cajas_detalle, format: :json)
end
