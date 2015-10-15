json.array!(@ciudades) do |ciudad|
  json.extract! ciudad, :id, :descripcion, :codigo_postal, :departamento_id
  json.url ciudad_url(ciudad, format: :json)
end
