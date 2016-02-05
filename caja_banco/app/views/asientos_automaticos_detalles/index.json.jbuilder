json.array!(@asientos_automaticos_detalles) do |asiento_automatico_detalle|
  json.extract! asiento_automatico_detalle, :id, :asiento_automatico_id, :cuenta_id, :monto_debito, :monto_credito
  json.url asiento_automatico_detalle_url(asiento_automatico_detalle, format: :json)
end
