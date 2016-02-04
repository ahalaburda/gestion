json.array!(@asientos_automaticos) do |asiento_automatico|
  json.extract! asiento_automatico, :id, :tipo_de_asiento, :descripcion, :fecha
  json.url asiento_automatico_url(asiento_automatico, format: :json)
end
