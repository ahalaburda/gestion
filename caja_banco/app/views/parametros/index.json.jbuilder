json.array!(@parametros) do |parametro|
  json.extract! parametro, :id, :nombre_empresa, :logo_empresa
  json.url parametro_url(parametro, format: :json)
end
