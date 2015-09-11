json.array!(@bancos) do |banco|
  json.extract! banco, :id, :nombre, :direccion, :telefono
  json.url banco_url(banco, format: :json)
end
